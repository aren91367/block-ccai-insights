view: dialogflow_data {
  sql_table_name: @{DIALOGFLOW_TABLE} ;;
  view_label: "1: Conversations"

  dimension: agent_id {
    group_label: "Agent"
    type: string
    sql: ${TABLE}.agent_id ;;
    group_item_label: "Agent ID"

  }

  dimension: agent_name {
    group_label: "Agent"
    type: string
    description: "Agent name based on the IDs"
    sql: CASE
          WHEN ((${agent_id} ='5b1cc841-4d2c-4ae8-8617-52fed508b6a6') OR (${agent_id} ='5b1cc841-4d2c-4ae8-8617-52fed508b6a6'))  THEN "Claimant Bot"
          WHEN ((${agent_id} ='c593f4ff-41d6-43f5-be2a-ebd95da0a88d') OR (${agent_id} ='c593f4ff-41d6-43f5-be2a-ebd95da0a88d'))  THEN "Employer Bot"
          ELSE ${agent_id} END;;
    group_item_label: "Agent Name"
  }

  dimension: bot_type {
    group_label: "Agent"
    type: string
    sql: ${TABLE}.botType ;;
    group_item_label: "Agent Type"
  }

  dimension: project_id {
    group_label: "Agent"
    type: string
    sql: ${TABLE}.project_id ;;
    group_item_label: "Project ID"
  }

  dimension: bot_answer_feedback__rating {
    group_label: "Rating"
    type: string
    sql: ${TABLE}.bot_answer_feedback.rating ;;
    group_item_label: "Rating Score"
  }

  dimension: rating_category {
    group_label: "Rating"
    type: string
    description: "Negative sentiment score is bad, 0 sentiment score is neutral, and positive sentiment score is good."
    sql: CASE
          WHEN ${bot_answer_feedback__rating} ='THUMBS_UP' THEN "Positive"
          WHEN ${bot_answer_feedback__rating} ='THUMBS_DOWN' THEN "Negative"
        END;;
    drill_fields: [record_info*]
  }

  dimension: rating_comment {
    type: string
    sql: ${TABLE}.bot_answer_feedback.ratingReason.feedback ;;
    group_label: "Rating"
    group_item_label: "Rating Comments"
  }
  dimension: rating_reason {
    type: string
    sql: ${TABLE}.bot_answer_feedback.ratingReason.reasonLabels ;;
    group_label: "Rating"
    group_item_label: "Rating Reason"
  }

  dimension: conversation_date {
    hidden: yes
    type: string
    sql: ${TABLE}.conversation_date ;;
  }
  dimension: conversation_name {
    hidden: yes
    type: string
    sql: ${TABLE}.conversation_name ;;
  }


  dimension: day {
    hidden: yes
    type: string
    sql: ${TABLE}.day ;;
  }
  dimension: hour {
    hidden: yes
    type: string
    sql: ${TABLE}.hour ;;
  }
  dimension: language_code {
    hidden: yes
    type: string
    sql: ${TABLE}.language_code ;;
  }
  dimension: minute {
    hidden: yes
    type: string
    sql: ${TABLE}.minute ;;
  }
  dimension: month {
    hidden: yes
    type: string
    sql: ${TABLE}.month ;;
  }

  dimension: request_event {
    type: string
    sql: ${TABLE}.request.queryInput.event.event ;;
    group_label: "Request"
    group_item_label: "Event"
  }
  dimension: request__query_input__language_code {
    type: string
    sql: ${TABLE}.request.queryInput.languageCode ;;
    group_label: "Request"
    group_item_label: "Language Code"
  }
  dimension: request_text {
    type: string
    sql: ${TABLE}.request.queryInput.text.text ;;
    group_label: "Request"
    group_item_label: "Text"
  }
  dimension: request__query_params__parameters__user_type {
    type: string
    sql: ${TABLE}.request.queryParams.parameters.userType ;;
    group_label: "Request"
    group_item_label: "User Type"
  }
  dimension: request__session {
    type: string
    sql: ${TABLE}.request.session ;;
    group_label: "Request"
    group_item_label: "Session"
  }
  dimension_group: start{
    group_label: "Dates"
    type: time
    timeframes: [raw, time, hour, hour_of_day, minute, second, date, day_of_week, week, month, month_name, quarter, year]
    sql: ${TABLE}.request_time ;;
  }

  dimension_group: load {
    group_label: "Dates"
    label: "Import"
    type: time
    timeframes: [time, hour_of_day, date, day_of_week, week, month_name, year, raw]
    description: "The time in UTC at which the conversation was loaded into Insights."
    sql: ${TABLE}.request_time ;;
  }

  dimension: response__match__confidence {
    type: string
    sql: ${TABLE}.response.match.confidence ;;
    group_label: "Response"
    group_item_label: "Confidence"
  }
  dimension: response__match__event {
    type: string
    sql: ${TABLE}.response.match.event ;;
    group_label: "Response"
    group_item_label: "Event"
  }
  dimension: intent_name {
    type: string
    sql: ${TABLE}.response.match.intent.displayName ;;
    group_label: "Response"
    group_item_label: "Intent Name"
  }


  dimension: intent_id {
    type: string
    sql: ${TABLE}.response.match.intent.intentid ;;
    group_label: "Response"
    group_item_label: "Intent ID"
  }
  dimension: response__match__match_type {
    type: string
    sql: ${TABLE}.response.match.matchType ;;
    group_label: "Response"
    group_item_label: "Match Type"
    label: "Match Type"
  }
  dimension: response_resolved_input {
    type: string
    sql: ${TABLE}.response.match.resolvedInput ;;
    group_label: "Response"
    group_item_label: "Resolved Input"
  }
  dimension: response_text {
    type: string
    sql: ${TABLE}.response.responseMessages.responseText ;;
    group_label: "Response"
    group_item_label: "Response Text"
  }
  dimension: response__response_messages__response_type {
    type: string
    sql: ${TABLE}.response.responseMessages.responseType ;;
    group_label: "Response"
    group_item_label: "Response Type"
    label: "Response Type"
  }
  dimension: source {
    type: string
    sql: ${TABLE}.response.responseMessages.source ;;
    group_label: "Response"
    group_item_label: "Source"
  }
  dimension: second {
    hidden:  yes
    type: string
    sql: ${TABLE}.second ;;
  }
  dimension: timezone {
    group_label: "Dates"
    type: string
    sql: ${TABLE}.timezone ;;
  }
  dimension: turn_position {
    type: number
    sql: ${TABLE}.turn_position ;;
  }
  dimension: record_id {
    type: string
    sql: ${TABLE}.uuid ;;

  }
  dimension: year {
    hidden:  yes
    type: string
    sql: ${TABLE}.year ;;
  }
  measure: conversation_count {
    type: count
    drill_fields: [record_info*]
  }

  measure: contained_count {
    description: "A conversation is considered contained if it was never passed to a human agent."
    type: count
    filters: [source: "VIRTUAL_AGENT"]
    drill_fields: [record_info*]
  }

  measure: default_welcome_intent_count {
    description: "Default welcome intent is triggered when the user returns to the welcome prompt by asking question such as get started."
    type: count
    filters: [request_event: "Default Welcome Intent"]
    hidden: yes
  }

  measure: response_default_welcome_event_count {
    description: "Default welcome event is triggered when the clicks on the Claimant or Employer button."
    type: count
    filters: [response__match__event: "DEFAULT_WELCOME_EVENT"]
    hidden: yes
  }

  measure: request_default_welcome_event_count {
    description: "Default welcome event is triggered when the response is DEFAULT_WELCOME_INTENT."
    type: count
    filters: [request_event: "DEFAULT_WELCOME_EVENT"]
    hidden: yes
  }

  measure: default_welcome_event_count {
    description: "Default welcome event is triggered when the response is DEFAULT_WELCOME_INTENT."
    type: number
    sql: ${default_welcome_intent_count}+${request_default_welcome_event_count}+${response_default_welcome_event_count};;
    label: "Total Welcome Triggers"
    drill_fields: [intent_info*]
  }

  measure: sys_no_input_default_count {
    description: "Total number of no input event triggered."
    type: count
    filters: [response__match__event: "sys.no-input-default"]
    label: "No Input"
  }

  measure: sys_no_match_1_count {
    description: "Total number of no match event triggered on first try."
    type: count
    filters: [response__match__event: "sys.no-match-1"]
    label: "First No Match"
  }

  measure: sys_no_match_2_count {
    description: "Total number of no match event triggered on second try."
    type: count
    filters: [response__match__event: "sys.no-match-2"]
    label: "Second No Match"
  }

  measure: sys_no_match_3_count {
    description: "Total number of no match event triggered on third try."
    type: count
    filters: [response__match__event: "sys.no-match-3"]
    label: "Third No Match"
  }

  measure: sys_no_match_default_count {
    description: "Total number of no match event triggered on default."
    type: count
    filters: [response__match__event: "sys.no-match-default"]
    label: "Default No Match"
  }
  measure: sys_no_match {
    description: "Total number of no match event triggered."
    type: number
    sql:  ${sys_no_match_1_count}+${sys_no_match_2_count}+${sys_no_match_3_count}+${sys_no_input_default_count};;
    label: "Total No Match"
    drill_fields: [intent_info*]
  }


  measure: contained_percentage {
    description: "A conversation is considered contained if it was never passed to a human agent."
    type: number
    sql: ${contained_count}/${conversation_count} ;;
    value_format_name: percent_0
    drill_fields: [record_info*]
  }

  measure: positive_feedback_count {
    description: "A conversation that has thumbs up or thumbs down record."
    type: count
    filters: [rating_category: "Positive"]
    drill_fields: [record_info*]
  }

  measure: negative_feedback_count {
    description: "A conversation that has thumbs up or thumbs down record."
    type: count
    filters: [rating_category: "Negative"]
    drill_fields: [record_info*]
  }

  measure: neutral_feedback_count {
    description: "A conversation that has thumbs up or thumbs down record."
    type: count
    filters: [rating_category: "Neutral"]
    drill_fields: [record_info*]
  }

  measure: total_feedback_count {
    description: "Total Feedback Count"
    type: number
    sql: ${positive_feedback_count}+${negative_feedback_count} ;;
    value_format_name: decimal_0
    drill_fields: [record_info*]
  }

  measure: negative_feedback_ratio {
    label: "Negative Feedback Ratio"
    description: "Negative Feedback / Total Feedback"
    group_label: "Feedback"
    type: number
    sql: ${negative_feedback_count}/NULLIF(${total_feedback_count},0) ;;
    value_format_name: percent_0
    drill_fields: [record_info*]
  }

  measure: positive_feedback_ratio {
    label: "Positive Feedback Ratio"
    description: "Positive Feedback / Total Feedback"
    group_label: "Feedback"
    type: number
    sql: ${positive_feedback_count}/NULLIF(${total_feedback_count},0) ;;
    value_format_name: percent_0
    drill_fields: [record_info*]
  }


  set: record_info {
    fields: [agent_name,agent_id,intent_name,intent_id,request_event,request_text,response_text,positive_feedback_count,negative_feedback_count]
  }

  set: intent_info {
    fields: [response__match__event,conversation_count,request_text,response_text,intent_name,intent_id]
  }
}
