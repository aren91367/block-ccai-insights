#    Copyright 2024 Google LLC

#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at

#        http://www.apache.org/licenses/LICENSE-2.0

#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.

"""Convert wav files to flac.

Script converts wav files stored in GCS bucket to flac files using ffmpeg
and upload them to different GCS bucket.
"""

import argparse
import os
import google.auth
from google.auth import impersonated_credentials
import google.auth.transport.requests
from google.cloud import storage


def _ParseArgs():
  """Parse script arguments."""
  parser = argparse.ArgumentParser()

  parser.add_argument(
      '--dest_gcs_bucket',
      help='Name of the GCS bucket that will hold converted flac files.',
  )

  parser.add_argument(
      '--src_gcs_bucket', help='Name of the GCS bucket that holds wav files.'
  )

  parser.add_argument(
      '--project_id',
      help='Project ID (not number) for the project to own the conversation.',
  )

  parser.add_argument(
      '--impersonated_service_account',
      help=(
          'A service account to impersonate. If specified, then GCP requests '
          'will be authenticated using service account impersonation. '
          'Otherwise, the gcloud default credential will be used.'
      ),
  )

  parser.add_argument(
      '--sample_rate_hertz', default=8000, type=int, help='Sample rate.'
  )

  return parser.parse_args()


def _GetClientCredentials(impersonated_service_account):
  """Gets client credentials for GCP requests.

  If an account to impersonate is provided, then it will be used rather than the
  default. Otherwise, default gcloud credentials will be used.

  Args:
      impersonated_service_account: The service account to impersonate.

  Returns:
      A credential for requests to GCP.
  """
  creds, _ = google.auth.default(
      scopes=['https://www.googleapis.com/auth/cloud-platform']
  )
  if not impersonated_service_account:
    return creds
  target_scopes = ['https://www.googleapis.com/auth/cloud-platform']
  target_credentials = impersonated_credentials.Credentials(
      source_credentials=creds,
      target_principal=impersonated_service_account,
      target_scopes=target_scopes,
      lifetime=3600,
  )
  # Override the source credentials so refresh will work.
  # See https://github.com/googleapis/google-auth-library-python/issues/416.
  # pylint: disable=protected-access
  target_credentials._source_credentials._scopes = creds.scopes
  return target_credentials


def _DownloadFileFromGcs(
    bucket_name,
    source_blob_name,
    filename,
    project_id,
    impersonated_service_account,
):
  """Downloads a blob from the bucket.

  Args:
    bucket_name: The name of the GCS bucket that will hold the file.
    source_blob_name: Object blob to store.
    filename: Destination file name.
    project_id: The project ID (not number) to use for redaction.
    impersonated_service_account: The service account to impersonate.
  """
  storage_client = storage.Client(
      project=project_id,
      credentials=_GetClientCredentials(impersonated_service_account),
  )
  bucket = storage_client.bucket(bucket_name)
  blob = bucket.blob(source_blob_name)
  blob.download_to_filename(filename)


def _UploadFileToGcs(
    bucket_name,
    source_file_name,
    destination_blob_name,
    project_id,
    impersonated_service_account,
):
  """Uploads a local audio file to GCS.

  Args:
    bucket_name: The name of the GCS bucket that will hold the file.
    source_file_name: The name of the source file.
    destination_blob_name: The name of the blob that will be uploaded to GCS.
    project_id: The project ID (not number) to use for redaction.
    impersonated_service_account: The service account to impersonate.
  """
  storage_client = storage.Client(
      project=project_id,
      credentials=_GetClientCredentials(impersonated_service_account),
  )
  bucket = storage_client.bucket(bucket_name)
  blob = bucket.blob(destination_blob_name)
  blob.upload_from_filename(source_file_name)

  os.remove(source_file_name)


def _GetGcsUris(bucket, project_id, impersonated_service_account):
  """Returns a list of GCS uris for files in a bucket.

  Args:
      bucket: The GCS bucket.
      project_id: The project ID (not number) to use.
      impersonated_service_account: The service account to impersonate.

  Returns:
      The GCS uris.
  """
  uris, files = [], []
  storage_client = storage.Client(
      project=project_id,
      credentials=_GetClientCredentials(impersonated_service_account),
  )
  blobs = storage_client.list_blobs(bucket)
  for blob in blobs:
    # Blobs ending in slashes are actually directory paths.
    if not blob.name.endswith('/'):
      uris.append(_GetGcsUri(bucket, blob.name))
      files.append(blob.name)
  return uris, files


def _GetGcsUri(bucket, object_name):
  """Returns a GCS uri for the given bucket and object.

  Args:
      bucket: The bucket in the URI.
      object_name: The name of the object.

  Returns:
      The GCS uri.
  """
  return 'gs://{}/{}'.format(bucket, object_name)


def _ConvertWavToFlac(input_file, sample_rate=8000):
  """Converts wav file to flac.
  
  Args:
    input_file: Wav audio file name
    sample_rate: Sample rate in hertz
    
  Returns:
    output_file: Flac audio file name
  """

  output_file = input_file.replace('.wav', '.flac')
  os.system(f"""ffmpeg -loglevel quiet -hide_banner -i \
    {"'"+input_file+"'"} {"'"+output_file+"'"}
    """)

  os.remove(input_file)
  return output_file


def _ConvertWavToFlacRunner(
    source_file,
    input_bucket_name,
    output_bucket_name,
    project_id,
    impersonated_service_account,
    sample_rate
):
  """Downloads wav file from gcs, convert it to flac and store it to gcs. 

  Args:
    source_file: Wav audio file name
    input_bucket_name: Bucket where wav audio files are present
    output_bucket_name: Bucket where flac audio files to be stored
    project_id: GCP project id
    impersonated_service_account: The service account to impersonate.
    sample_rate: Sample rate in hertz
  """
  # download file from GCS in tmp folder
  filename = f'/tmp/{source_file}'
  _DownloadFileFromGcs(
      input_bucket_name,
      source_file,
      filename,
      project_id,
      impersonated_service_account
  )

  # run ffmpeg using os and store the converted file to tmp folder
  output_file = _ConvertWavToFlac(filename, sample_rate)
  # print('output_file',output_file)

  # upload the converted file to GCS
  destination_blob_name = output_file.replace('/tmp/', '')
  # print('destination_file',destination_blob_name)

  _UploadFileToGcs(
      output_bucket_name,
      output_file,
      destination_blob_name,
      project_id,
      impersonated_service_account
  )


def _BatchConvertWavToFlacPipeline(
    input_bucket_name,
    output_bucket_name,
    project_id,
    impersonated_service_account,
    sample_rate=8000
):
  """Pipeline to convert wav to flac.
  
  Args:
    input_bucket_name: Bucket where wav audio files are present
    output_bucket_name: Bucket where flac audio files to be stored
    project_id: GCP project id
    impersonated_service_account: The service account to impersonate.
    sample_rate: Sample rate in hertz
  """
  # get all files present in the bucket
  _, files = _GetGcsUris(
      input_bucket_name,
      project_id,
      impersonated_service_account
  )

  for source_file in files:
    _ConvertWavToFlacRunner(
        source_file,
        input_bucket_name,
        output_bucket_name,
        project_id,
        impersonated_service_account,
        sample_rate
    )

if __name__ == '__main__':

  pargs = _ParseArgs()
  input_bucket_name_ = pargs.src_gcs_bucket
  output_bucket_name_ = pargs.dest_gcs_bucket
  project_id_ = pargs.project_id
  impersonated_service_account_ = pargs.impersonated_service_account
  sample_rate_ = pargs.sample_rate_hertz

  if impersonated_service_account_ == 'None':
    impersonated_service_account_ = None

  _BatchConvertWavToFlacPipeline(
      input_bucket_name_,
      output_bucket_name_,
      project_id_,
      impersonated_service_account_,
      sample_rate_
  )
