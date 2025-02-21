---
- dashboard: intent_peformance_dashboard
  title: "Intent Peformance Dashboard"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  refresh: 1 hour
  preferred_slug: WjeuR1qcravbZVDK05jFJF
  elements:
  - title: Failed Count
    name: Failed Count
    model: ccai_dialogflow_data_prod
    explore: dialogflow_data
    type: single_value
    fields: [dialogflow_data.sys_no_match]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: above
    note_text: Total number of no match event triggered.
    listen:
      Bot Type: dialogflow_data.bot_type
      Start Date: dialogflow_data.start_date
      Intent Name: dialogflow_data.intent_name
      Match Event: dialogflow_data.response__match__event
      Request Text: dialogflow_data.request_text
      Rating Category: dialogflow_data.rating_category
      Rating Reason: dialogflow_data.rating_reason
    row: 0
    col: 6
    width: 4
    height: 2
  - title: Welcome Triggers
    name: Welcome Triggers
    model: ccai_dialogflow_data_prod
    explore: dialogflow_data
    type: single_value
    fields: [dialogflow_data.default_welcome_event_count]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Bot Type: dialogflow_data.bot_type
      Start Date: dialogflow_data.start_date
      Intent Name: dialogflow_data.intent_name
      Match Event: dialogflow_data.response__match__event
      Request Text: dialogflow_data.request_text
      Rating Category: dialogflow_data.rating_category
      Rating Reason: dialogflow_data.rating_reason
    row: 0
    col: 10
    width: 4
    height: 2
  - title: Failed Count by Date
    name: Failed Count by Date
    model: ccai_dialogflow_data_prod
    explore: dialogflow_data
    type: looker_column
    fields: [dialogflow_data.sys_no_match, dialogflow_data.start_date]
    fill_fields: [dialogflow_data.start_date]
    sorts: [dialogflow_data.start_date desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Bot Type: dialogflow_data.bot_type
      Start Date: dialogflow_data.start_date
      Intent Name: dialogflow_data.intent_name
      Match Event: dialogflow_data.response__match__event
      Request Text: dialogflow_data.request_text
      Rating Category: dialogflow_data.rating_category
      Rating Reason: dialogflow_data.rating_reason
    row: 4
    col: 0
    width: 24
    height: 10
  - title: Top 10 Intents
    name: Top 10 Intents
    model: ccai_dialogflow_data_prod
    explore: dialogflow_data
    type: looker_grid
    fields: [dialogflow_data.intent_name, dialogflow_data.request_text, dialogflow_data.conversation_count]
    sorts: [dialogflow_data.conversation_count desc]
    limit: 10
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: faq
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: faq
      args:
      - dialogflow_data.intent_name
      - - label: faq
          filter: "%faq%"
      -
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      description: ''
      label: FAQ Group
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: faq_group
      args:
      - dialogflow_data.intent_name
      - - label: faq
          filter: "%faq%"
      -
      _kind_hint: dimension
      _type_hint: string
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_pivots: {}
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: Top 10 Intents with request text which triggered the intent.
    listen:
      Bot Type: dialogflow_data.bot_type
      Start Date: dialogflow_data.start_date
      Intent Name: dialogflow_data.intent_name
      Match Event: dialogflow_data.response__match__event
      Request Text: dialogflow_data.request_text
      Rating Category: dialogflow_data.rating_category
      Rating Reason: dialogflow_data.rating_reason
    row: 29
    col: 0
    width: 24
    height: 6
  - title: Positive Feedback % of Total
    name: Positive Feedback % of Total
    model: ccai_dialogflow_data_prod
    explore: dialogflow_data
    type: single_value
    fields: [dialogflow_data.positive_feedback_ratio]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: greater than, value: 0.2, background_color: '',
        font_color: "#137333", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: less than, value: 0.7, background_color: '',
        font_color: "#F9AB00", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: less than, value: 0.2, background_color: '',
        font_color: "#EA4335", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: above
    note_text: Ratio of Positive Feedback i.e. Thumbs Up to Total User Feedback
    listen:
      Bot Type: dialogflow_data.bot_type
      Start Date: dialogflow_data.start_date
      Intent Name: dialogflow_data.intent_name
      Match Event: dialogflow_data.response__match__event
      Request Text: dialogflow_data.request_text
      Rating Category: dialogflow_data.rating_category
      Rating Reason: dialogflow_data.rating_reason
    row: 2
    col: 10
    width: 4
    height: 2
  - title: Negative Feedback % of Total
    name: Negative Feedback % of Total
    model: ccai_dialogflow_data_prod
    explore: dialogflow_data
    type: single_value
    fields: [dialogflow_data.negative_feedback_ratio]
    filters: {}
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: less than, value: 0.2, background_color: '', font_color: "#137333",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: less
          than, value: 0.7, background_color: '', font_color: "#F9AB00", color_application: {
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: greater
          than, value: 0.7, background_color: '', font_color: "#EA4335", color_application: {
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: above
    note_text: Ratio of Negative Feedback i.e. Thumbs Up to Total User Feedback
    listen:
      Bot Type: dialogflow_data.bot_type
      Start Date: dialogflow_data.start_date
      Intent Name: dialogflow_data.intent_name
      Match Event: dialogflow_data.response__match__event
      Request Text: dialogflow_data.request_text
      Rating Category: dialogflow_data.rating_category
      Rating Reason: dialogflow_data.rating_reason
    row: 2
    col: 6
    width: 4
    height: 2
  - title: Total User Feedback
    name: Total User Feedback
    model: ccai_dialogflow_data_prod
    explore: dialogflow_data
    type: single_value
    fields: [dialogflow_data.total_feedback_count]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: above
    note_text: Total user feedback received. i.e. Total number of Thumbs Up and Thumbs
      Down.
    listen:
      Bot Type: dialogflow_data.bot_type
      Start Date: dialogflow_data.start_date
      Intent Name: dialogflow_data.intent_name
      Match Event: dialogflow_data.response__match__event
      Request Text: dialogflow_data.request_text
      Rating Category: dialogflow_data.rating_category
      Rating Reason: dialogflow_data.rating_reason
    row: 0
    col: 14
    width: 4
    height: 2
  - title: Feedback Analyzed by Agent Type
    name: Feedback Analyzed by Agent Type
    model: ccai_dialogflow_data_prod
    explore: dialogflow_data
    type: looker_column
    fields: [dialogflow_data.total_feedback_count, dialogflow_data.start_date, dialogflow_data.bot_type]
    pivots: [dialogflow_data.bot_type]
    fill_fields: [dialogflow_data.start_date]
    sorts: [dialogflow_data.bot_type, dialogflow_data.total_feedback_count desc 0]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_pivots:
      dialogflow_data.bot_type___null:
        is_entire_pivot_hidden: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Bot Type: dialogflow_data.bot_type
      Start Date: dialogflow_data.start_date
      Intent Name: dialogflow_data.intent_name
      Match Event: dialogflow_data.response__match__event
      Request Text: dialogflow_data.request_text
      Rating Category: dialogflow_data.rating_category
      Rating Reason: dialogflow_data.rating_reason
    row: 37
    col: 0
    width: 16
    height: 6
  - title: Client Feedback By Day of Week
    name: Client Feedback By Day of Week
    model: ccai_dialogflow_data_prod
    explore: dialogflow_data
    type: looker_column
    fields: [dialogflow_data.rating_category, dialogflow_data.conversation_count,
      dialogflow_data.start_day_of_week]
    pivots: [dialogflow_data.rating_category]
    fill_fields: [dialogflow_data.start_day_of_week]
    sorts: [dialogflow_data.rating_category desc, dialogflow_data.conversation_count
        desc 2]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      Negative - dialogflow_data.conversation_count: "#EA4335"
      Positive - dialogflow_data.conversation_count: "#7CB342"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots:
      Neutral:
        is_entire_pivot_hidden: true
      Negative:
        is_entire_pivot_hidden: false
      Positive:
        measure_names: []
      dialogflow_data.rating_category___null:
        is_entire_pivot_hidden: true
    hidden_fields:
    show_null_points: true
    interpolation: linear
    groupBars: true
    labelSize: 10pt
    showLegend: true
    up_color: false
    down_color: false
    total_color: false
    listen:
      Bot Type: dialogflow_data.bot_type
      Start Date: dialogflow_data.start_date
      Intent Name: dialogflow_data.intent_name
      Match Event: dialogflow_data.response__match__event
      Request Text: dialogflow_data.request_text
      Rating Category: dialogflow_data.rating_category
      Rating Reason: dialogflow_data.rating_reason
    row: 43
    col: 12
    width: 12
    height: 7
  - title: Client Feedback Makeup
    name: Client Feedback Makeup
    model: ccai_dialogflow_data_prod
    explore: dialogflow_data
    type: looker_area
    fields: [dialogflow_data.rating_category, dialogflow_data.conversation_count,
      dialogflow_data.start_day_of_week]
    pivots: [dialogflow_data.rating_category]
    fill_fields: [dialogflow_data.start_day_of_week]
    sorts: [dialogflow_data.rating_category desc, dialogflow_data.conversation_count
        desc 2]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      Negative - dialogflow_data.conversation_count: "#EA4335"
      Positive - dialogflow_data.conversation_count: "#7CB342"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots:
      Neutral:
        is_entire_pivot_hidden: true
      Negative:
        is_entire_pivot_hidden: false
      Positive:
        measure_names: []
      dialogflow_data.rating_category___null:
        is_entire_pivot_hidden: true
    hidden_fields:
    groupBars: true
    labelSize: 10pt
    showLegend: true
    up_color: false
    down_color: false
    total_color: false
    listen:
      Bot Type: dialogflow_data.bot_type
      Start Date: dialogflow_data.start_date
      Intent Name: dialogflow_data.intent_name
      Match Event: dialogflow_data.response__match__event
      Request Text: dialogflow_data.request_text
      Rating Category: dialogflow_data.rating_category
      Rating Reason: dialogflow_data.rating_reason
    row: 43
    col: 0
    width: 12
    height: 7
  - title: Feedback Data Details by Date and Intent
    name: Feedback Data Details by Date and Intent
    model: ccai_dialogflow_data_prod
    explore: dialogflow_data
    type: looker_grid
    fields: [dialogflow_data.start_date, dialogflow_data.intent_name, dialogflow_data.intent_id,
      dialogflow_data.request_text, dialogflow_data.request_event, dialogflow_data.response_text,
      dialogflow_data.positive_feedback_count, dialogflow_data.negative_feedback_count,
      dialogflow_data.rating_comment]
    sorts: [dialogflow_data.positive_feedback_count desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Bot Type: dialogflow_data.bot_type
      Start Date: dialogflow_data.start_date
      Intent Name: dialogflow_data.intent_name
      Match Event: dialogflow_data.response__match__event
      Request Text: dialogflow_data.request_text
      Rating Category: dialogflow_data.rating_category
      Rating Reason: dialogflow_data.rating_reason
    row: 50
    col: 0
    width: 24
    height: 11
  - title: Intents identified for Feedback
    name: Intents identified for Feedback
    model: ccai_dialogflow_data_prod
    explore: dialogflow_data
    type: looker_grid
    fields: [dialogflow_data.intent_name, dialogflow_data.intent_id, dialogflow_data.positive_feedback_count,
      dialogflow_data.negative_feedback_count]
    sorts: [dialogflow_data.positive_feedback_count desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      dialogflow_data.positive_feedback_count:
        is_active: true
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Bot Type: dialogflow_data.bot_type
      Start Date: dialogflow_data.start_date
      Intent Name: dialogflow_data.intent_name
      Match Event: dialogflow_data.response__match__event
      Request Text: dialogflow_data.request_text
      Rating Category: dialogflow_data.rating_category
      Rating Reason: dialogflow_data.rating_reason
    row: 61
    col: 12
    width: 12
    height: 8
  - title: Smart Feedback by Agent Type
    name: Smart Feedback by Agent Type
    model: ccai_dialogflow_data_prod
    explore: dialogflow_data
    type: looker_donut_multiples
    fields: [dialogflow_data.rating_category, dialogflow_data.total_feedback_count,
      dialogflow_data.bot_type]
    pivots: [dialogflow_data.bot_type]
    sorts: [dialogflow_data.bot_type, dialogflow_data.total_feedback_count desc 0]
    limit: 500
    column_limit: 50
    show_value_labels: true
    font_size: 12
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots:
      dialogflow_data.bot_type___null:
        is_entire_pivot_hidden: true
    color_application: undefined
    listen:
      Bot Type: dialogflow_data.bot_type
      Start Date: dialogflow_data.start_date
      Intent Name: dialogflow_data.intent_name
      Match Event: dialogflow_data.response__match__event
      Request Text: dialogflow_data.request_text
      Rating Category: dialogflow_data.rating_category
      Rating Reason: dialogflow_data.rating_reason
    row: 37
    col: 16
    width: 8
    height: 6
  - title: Top 10 Feedback Intent
    name: Top 10 Feedback Intent
    model: ccai_dialogflow_data_prod
    explore: dialogflow_data
    type: looker_bar
    fields: [dialogflow_data.intent_name, dialogflow_data.total_feedback_count]
    filters: {}
    sorts: [dialogflow_data.total_feedback_count desc]
    limit: 10
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Bot Type: dialogflow_data.bot_type
      Start Date: dialogflow_data.start_date
      Intent Name: dialogflow_data.intent_name
      Match Event: dialogflow_data.response__match__event
      Request Text: dialogflow_data.request_text
      Rating Category: dialogflow_data.rating_category
      Rating Reason: dialogflow_data.rating_reason
    row: 61
    col: 0
    width: 12
    height: 8
  - name: Feedback Details
    type: text
    title_text: Feedback Details
    subtitle_text: ''
    body_text: ''
    row: 35
    col: 0
    width: 24
    height: 2
  - title: Intent Details w Request Text and Response
    name: Intent Details w Request Text and Response
    model: ccai_dialogflow_data_prod
    explore: dialogflow_data
    type: looker_grid
    fields: [dialogflow_data.response__match__event, dialogflow_data.request_text,
      dialogflow_data.response_text, dialogflow_data.intent_name, dialogflow_data.response__match__match_type,
      dialogflow_data.response__response_messages__response_type, dialogflow_data.intent_id,
      dialogflow_data.conversation_count]
    sorts: [dialogflow_data.conversation_count desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Bot Type: dialogflow_data.bot_type
      Start Date: dialogflow_data.start_date
      Intent Name: dialogflow_data.intent_name
      Match Event: dialogflow_data.response__match__event
      Request Text: dialogflow_data.request_text
      Rating Reason: dialogflow_data.rating_reason
      Rating Category: dialogflow_data.rating_category
    row: 14
    col: 0
    width: 24
    height: 15
  filters:
  - name: Bot Type
    title: Bot Type
    type: field_filter
    default_value: Claimant,Employer
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: ccai_dialogflow_data_prod
    explore: dialogflow_data
    listens_to_filters: []
    field: dialogflow_data.bot_type
  - name: Start Date
    title: Start Date
    type: field_filter
    default_value: 7 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: ccai_dialogflow_data_prod
    explore: dialogflow_data
    listens_to_filters: []
    field: dialogflow_data.start_date
  - name: Intent Name
    title: Intent Name
    type: field_filter
    default_value: faq%
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: ccai_dialogflow_data_prod
    explore: dialogflow_data
    listens_to_filters: []
    field: dialogflow_data.intent_name
  - name: Match Event
    title: Match Event
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: ccai_dialogflow_data_prod
    explore: dialogflow_data
    listens_to_filters: []
    field: dialogflow_data.response__match__event
  - name: Request Text
    title: Request Text
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: ccai_dialogflow_data_prod
    explore: dialogflow_data
    listens_to_filters: []
    field: dialogflow_data.request_text
  - name: Rating Reason
    title: Rating Reason
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: ccai_dialogflow_data_prod
    explore: dialogflow_data
    listens_to_filters: []
    field: dialogflow_data.rating_reason
  - name: Rating Category
    title: Rating Category
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: ccai_dialogflow_data_prod
    explore: dialogflow_data
    listens_to_filters: []
    field: dialogflow_data.rating_category
