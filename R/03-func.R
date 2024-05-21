# 03-func.R


# highcharts function -----------------------------------------------------

create_pie <- function (data, 
                        var, 
                        freq, 
                        my_colors = c(main_orange, light_blue, light_accent, NA_color),
                        my_legend) {
  highchart() %>%
    hc_add_dependency(
      name = "modules/accessibility.js"
      ) %>%
    hc_add_series(
      type = "pie", 
      data = data,
      hcaes(.data[[var]], .data[[freq]]),
      size = "100%", name = "", 
      borderColor = "#020202",
      borderWidth = .15
    ) %>%
    hc_plotOptions(
      pie =
        list(
          innerSize = "70%", # Set the inner size for the donut effect
          allowPointSelect = TRUE, # Enable point selection on the chart
          cursor = "pointer", # Set cursor style for selectable points
          dataLabels = list(
            enabled = TRUE, 
            format = "{point.freq_perc:.0f}",
            overflow = TRUE,
            distance = 10,
            padding = 2,
            style = list(
              color = dark_accent,
              fontFamily = "Jost",
              fontWeight = "500",
              fontSize = "20px",
              wordBreak = 'break-all',
              textOverflow = 'allow')
          ), # Disable data labels on the slices
          showInLegend = TRUE # Show legend for the chart
        )
    ) %>%
    # tooltip information
    hc_tooltip(
      useHTML = TRUE,
      headerFormat = "",
      pointFormat = "<div style='text-align: center;'> <b>{point.selectedVar}</b><br>{point.freq_perc}<br>n= {point.cnt} </div>",
      shadow = FALSE,
      borderWidth = 1,
      hideDelay = 1000,
      backgroundColor = "#fff",
      style = list(
        fontFamily = "Jost",
        fontSize = "15px"
      )
    ) %>%
    hc_colors(
      colors = my_colors
    ) %>%
    # adding the theme
    hc_add_theme(astho_theme) %>%
    # legend
    hc_legend(
      enabled = TRUE,
      reversed = FALSE,
      layout = "vertical",
      align = "center",
      verticalAlign = "bottom",
      itemMarginBottom = 3,
      itemMarginTop = 3,
      margin = 22,
      title = list(
        text = paste0(my_legend),
        style = list(
          textDecoration = "underline",
          fontFamily = "Jost",
          fontSize = "16px"
        )
      )
    ) %>%
    hc_exporting(
      enabled = TRUE,
      formAttributes = list(target = "_blank"),
      sourceHeight = 700, # come back
      sourceWidth = 1200, # come back
      allowHTML = TRUE, # come back
      url = "https://exporter.opifex.org",
      buttons = list(
        contextButton = list(
          symbol = "menu",
          symbolStrokeWidth = 2,
          symbolFill = icon_accent,
          symbolStroke = icon_accent,
          menuItems = c("printChart",
                        "separator",
                        "downloadPNG",
                        "downloadJPEG",
                        "downloadPDF",
                        "downloadSVG",
                        "separator",
                        "downloadCSV",
                        "downloadXLS",
                        "openInCloud")
        )
      )
    )
}





# Highcharter Map Function ------------------------------------------------
# Data in the highchartsData excel file.

create_map <- function(data, 
                       my_value,
                       data_class = data_classes, 
                       my_colors = main_colors,
                       my_click = NA,
                       title_text,
                       subtitle_text,
                       caption_text,
                       legend_text = NA,
                       my_tooltip,
                       my_reverse = TRUE
) {

  
  hc <- highchart(type = "map") %>%
    hc_add_dependency(
      name = "modules/accessibility.js"
    ) %>%
    hc_add_dependency(
      name = "modules/exporting.js"
      ) %>%
    hc_add_dependency(
      name = "modules/export-data.js"
      ) %>%
    hc_add_dependency(
      name = "modules/pattern-fill.js"
      ) %>%
    # hc_add_dependency(
    #   name = "modules/sonification.js"
    # ) %>%
    hc_add_custom_map_cat(
      data = data,
      value = my_value,
      joinBy = "fips",
      mapType = "c",
      borderColor = "#020202",
      borderWidth = .25,
      dataLabels = list(
        enabled = FALSE, 
        format = "{point.state}"
      ),
      accessibility = list(
        enabled = TRUE,
        exposeAsGroupOnly = TRUE,
        keyboardNavigation = list(
          enabled = TRUE),
        linkedDescription = "Map showing with U.S. state public health agencies have a community health worker certification program."
      ),
      # sonification = list(
      #   enabled = TRUE
      # )
    ) %>%
    hc_chart(
      height = 600
    ) %>%
    hc_colors(
      colors = my_colors
    ) %>%
    hc_colorAxis(
      dataClassColor = "category",
      dataClasses = data_class
    ) %>%
    hc_plotOptions(
      series = list(
        events = list(
          click = my_click
        ),
        accessibility = list(
          enabled = TRUE,
          description = "Map showing with U.S. state public health agencies have a community health worker certification program.",
          keyboardNavigation = list(
            enabled = TRUE
          )
        )
      )
    ) %>%
    hc_title(
      text = title_text, # title text
      margin = 10
    ) %>%
    hc_subtitle(
      text = subtitle_text, # text under title
      align = "center"
    ) %>%
    hc_caption(
      text = caption_text, # source and data notes
      useHTML = TRUE,
      margin = 20,
      align = "center"
    ) %>%
    hc_legend(
      reversed = my_reverse,
      enabled = TRUE,
      layout = "horizontal",
      align = "center",
      verticalAlign = "bottom",
      itemMarginBottom = 3,
      itemMarginTop = 3,
      margin = 22,
      title = list(
        text = legend_text
      )
    ) %>%
    hc_tooltip(
      headerFormat = "{point.JurisdictionName}",
      pointFormat = my_tooltip,
      useHTML = TRUE
    ) %>%
    hc_add_theme(
      astho_theme
    ) %>%
    hc_exporting(
      enabled = TRUE,
      accessibility = list(
        enabled = TRUE
      ),
      formAttributes = list(
        target = "_blank" # opens in new window
      ),
      sourceHeight = 700, # sets height of download
      sourceWidth = 1200, # sets width of download
      allowHTML = TRUE, 
      url = "https://exporter.opifex.org", #serve owned by John Coene
      buttons = list(
        contextButton = list(
          symbol = "menu",
          symbolStrokeWidth = 2,
          symbolFill = icon_accent,
          symbolStroke = icon_accent,
          menuItems = c("printChart",
                        "separator",
                        "downloadPNG",
                        "downloadJPEG",
                        "downloadPDF",
                        "downloadSVG",
                        "separator",
                        "downloadCSV",
                        "downloadXLS",
                        "openInCloud")
        )
      )
    )
  return(hc)
}

# Highcharter Bar Function ------------------------------------------------
create_column <- function(data,
                          my_type = "regular",
                          chart_type = "bar",
                          my_x,
                          my_y,
                          y_text,
                          my_max = 100,
                          my_format = "{value}",
                          title_text,
                          caption_text,
                          legend_enable = FALSE,
                          legend_text = "",
                          legend_reverse = FALSE,
                          my_tooltip,
                          my_group = "",
                          # annotation_text = "",
                          # annotation_x = NULL,
                          # annotation_y = NULL,
                          accessibility_text,
                          my_colors = main_colors,
                          subtitle_text = "",
                          drill = NULL
                          ) {


  if (my_type == "regular") {
    hc <-
      hchart(
        data,
        type = chart_type,
        hcaes(
          x = .data[[my_x]],
          y = .data[[my_y]]
        ),
        colorByPoint = FALSE
      )
  } else if (my_type == "group") {
    hc <-
      hchart(
        data,
        type = chart_type,
        hcaes(
          x = .data[[my_x]],
          y = .data[[my_y]],
          group = .data[[my_group]]
        )
      ) 
  } else if (my_type == "stack") {
    hc <-
      hchart(
        data,
        type = chart_type,
        hcaes(
          x = .data[[my_x]],
          y = .data[[my_y]],
          group = .data[[my_group]]
        ),
        stacking = "normal"
      ) 
    # %>%
    #   hc_add_annotation(
    #     labels = list(
    #       list(
    #         point =
    #           list(
    #             x = annotation_x,
    #             y = annotation_y,
    #             xAxis = 0,
    #             yAxis = 0
    #           ),
    #         text = annotation_text
    #       )
    #     ),
    #     labelOptions = list(
    #       style =list(
    #         fontFamily = "Jost",
    #         fontSize = "12px",
    #         fontWeight = "normal",
    #         paddingLeft = "5px"
    #       ),
    #       align = "left",
    #       allowOverlap = TRUE
    #     )
    #   ) 
  } else if (my_type == "drill") {

    # JS Click Function
    click_chart <- JS(
      # a bit complicated by this is the only way to get the namespace to work
      paste0("function(event) {
           Shiny.onInputChange(
           '",
             ns('chart_clicked'),
             "',
           event.point.name);}"
      )
    )
    hc <-
      hchart(
        data,
        type = chart_type,
        hcaes(
          x = .data[[my_x]],
          y = .data[[my_y]],
          drilldown = .data[[my_group]]
        ),
        colorByPoint = FALSE
      ) %>%
      hc_chart(type = type,
               events = list(
                 load =
                   JS("function() {
                      console.log(this)
                      }"),
                 drilldown =
                   JS("function(e) {
                      this.xAxis[0].update({title: {text: e.point.group_label + ' for ' + e.point.name}})
                      }"),
                 drillup =
                   JS("function(e) {
                      this.xAxis[0].update({title: {text: ''}})
                      }")
               )
      ) %>%
      hc_drilldown(
        activeAxisLabelStyle = list(
          fontFamily = "Jost",
          fontSize = "16px",
          fontWeight = "normal",
          textDecoration = "none",
          color = "#666"
        ),
        drillUpButton = list(
          position = list(
            verticalAlign = "top",
            y = -35
          ),
          theme = list(
            fill = "none",
            stroke = "white",
            style = list(
              fontFamily = "Jost",
              fontSize = "14px",
              fontWeight = "normal",
              color = "#C65227"
            )
          )
        ),
        breadcrumbs = list(
          format = "back to {level.name}",
          showFullPath = TRUE
        ),
        allowPointDrilldown = TRUE,
        series = list_parse(drill)
      ) 
  } 

  hc <-
    hc %>%
    hc_add_dependency(
      name = "modules/accessibility.js"
    ) %>%
    hc_add_dependency(
      name = "modules/exporting.js"
    ) %>%
    hc_add_dependency(
      name = "modules/export-data.js"
    ) %>%
    hc_add_dependency(
      name = "modules/pattern-fill.js"
    ) %>%
    hc_chart(
      height = 600
    ) %>%
    hc_colors(
      colors = my_colors
    ) %>%
    hc_plotOptions(
      series = list(
        accessibility = list(
          enabled = TRUE,
          description = accessibility_text,
          keyboardNavigation = list(
            enabled = TRUE
          )
        )
      )
    ) %>%
    hc_xAxis(
      title = list(text = "")
    ) %>%
    hc_yAxis(
      title = list(text = y_text), # y-axis label
      max = my_max,
      min = 0,
      labels = list(
        format = my_format
      )
    ) %>%
    hc_title(
      text = title_text, # title text
      margin = 40,
      widthAdjust = -60
    ) %>%
    hc_subtitle(
      text = subtitle_text # text under title
    ) %>%
    hc_caption(
      text = caption_text, # source and data notes
      useHTML = TRUE,
      margin = 20,
      align = "center"
    ) %>%
    hc_legend(
      reversed = legend_reverse,
      enabled = legend_enable, # enabled legend
      layout = "horizontal",
      align = "center",
      verticalAlign = "bottom",
      itemMarginBottom = 3,
      itemMarginTop = 3,
      margin = 22,
      title = list(
        text = legend_text
      )
    ) %>%
    hc_tooltip(
      pointFormat = my_tooltip,
      useHTML = TRUE,
      outside = TRUE
    ) %>%
    hc_add_theme(
      astho_theme
    ) %>%
    hc_exporting(
      enabled = TRUE,
      accessibility = list(
        enabled = TRUE
      ),
      formAttributes = list(target = "_blank"),
      sourceHeight = 700, # set the size of the export
      sourceWidth = 1200, # set the size of the export
      allowHTML = TRUE,
      url = "https://exporter.opifex.org", # exports to server owned by John Coene
      buttons = list(
        contextButton = list(
          symbol = "menu", # controls hamburger icon for export
          symbolStrokeWidth = 2,
          symbolFill = icon_accent,
          symbolStroke = icon_accent,
          menuItems = c("printChart",
                        "separator",
                        "downloadPNG",
                        "downloadJPEG",
                        "downloadPDF",
                        "downloadSVG",
                        "separator",
                        "downloadCSV",
                        "downloadXLS",
                        "openInCloud")
        )
      )
    )

  return(hc)
}






create_fake <- function(data,
                        chart_type = "column",
                        my_x,
                        my_y,
                        y_text,
                        labels_enabled = FALSE,
                        my_format = "{value}",
                        title_text,
                        caption_text,
                        my_theme,
                        my_colors = main_colors
) {
  
    hc <-
      hchart(
        data,
        type = chart_type,
        hcaes(
          x = .data[[my_x]],
          y = .data[[my_y]]
        ),
        colorByPoint = FALSE,
        dataLabels = list(
          enabled = labels_enabled,
          style = list(
            color = "#fff"
          ),
          formatter = JS(
            "function() {
      var labels = ['7', '6', '5'];
      return labels[this.point.x];
    }"))
      ) %>%
    hc_colors(
      colors = my_colors
    ) %>%
    hc_xAxis(
      title = list(text = ""),
      labels = list(
        enabled = FALSE
      )
    ) %>%
    hc_yAxis(
      title = list(text = y_text) # y-axis label
    ) %>%
    hc_title(
      text = title_text, # title text
      margin = 10,
      widthAdjust = -60
    ) %>%
    hc_caption(
      text = caption_text, # source and data notes
      useHTML = TRUE,
      margin = 10,
      align = "center"
    ) %>%
    hc_tooltip(
      enabled = FALSE
    ) %>%
    hc_add_theme(
      my_theme
    ) 
  
  return(hc)
}


