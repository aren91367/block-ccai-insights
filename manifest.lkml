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

project_name: "ccai-insights"

constant: db_connection_name {
  value: "prj-myflfamilies-ccai-mvp-prod"
  export: override_optional
}

constant: insights_table {
  value: "bq_myflfamilies_ccai_insights.tbl_ccai_insights"
  export: override_optional
}
