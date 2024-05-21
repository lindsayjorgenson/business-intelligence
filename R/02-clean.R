# 02-clear.R


# set colors --------------------------------------------------------------

main_blue <- "#005182"
light_blue <- "#70C4E8"
main_orange <- "#c55434"
dark_orange <- "#90361F"
main_yellow <- "#EBB41F"
light_yellow <- "#FFD780"
NA_color <- "#E6E1E7"
dark_accent <- "#242c3d"
light_accent <- "#cae6f2"
icon_accent <- "#47BA83"
main_colors <- c(light_blue, main_orange, main_yellow, icon_accent, main_blue)



# define vizualization theme ----------------------------------------------

astho_theme <- hc_theme(
  colors = main_colors,
  chart = list(
    backgroundColor = NULL),
  style = list(
    fontFamily = "Jost"),
  title = list(
    style = list(
      color = dark_accent,
      fontFamily = "Jost",
      fontWeight = "500",
      fontSize = "20px")),
  subtitle = list(
    style = list(
      color = dark_accent,
      fontFamily = "Jost",
      fontSize = "14px")),
  caption = list(
    style = list(
      color = "#666",
      fontFamily = "Jost",
      fontSize = "13px")),
  xAxis = list(
    labels = list(
      style = list(
        fontFamily = "Jost",
        fontSize = "15px",
        fontWeight = "normal",
        textOverflow = 'none',
        color = "#666")),
    title = list(
      style = list(
        color = dark_accent,
        fontFamily = "Jost",
        fontWeight = "500",
        fontSize = "15px"))),
  yAxis = list(
    labels = list(
      style = list(
        fontFamily = "Jost",
        fontSize = "20px",
        fontWeight = "normal",
        color = "#666")),
    title = list(
      style = list(
        color = dark_accent,
        fontFamily = "Jost",
        fontWeight = "500",
        fontSize = "15px"))),
  legend = list(
    itemStyle = list(
      fontFamily = "Jost",
      color = dark_accent,
      fontSize = "17px",
      fontWeight = "normal",
      color = "#666"),
    title = list(
      style = list(
        textDecoration = "none",
        fontFamily = "Jost",
        fontSize = "16px"))),
  tooltip = list(
    padding = 10,
    borderRadius = 20,
    backgroundColor = "#fff",
    style = list(
      fontFamily = "Jost",
      fontSize = "16px",
      lineHeight = "20px")),
  itemHoverStyle = list(
    color = light_accent)
)





silly_theme_1 <- hc_theme(
  colors = main_colors,
  chart = list(
    backgroundColor = NULL),
  style = list(
    fontFamily = "Jost"),
  title = list(
    style = list(
      color = "#fff",
      fontFamily = "Jost",
      fontWeight = "500",
      fontSize = "12px")),
  subtitle = list(
    style = list(
      color = "#fff",
      fontFamily = "Jost",
      fontSize = "9px")),
  caption = list(
    style = list(
      color = "#fff",
      fontFamily = "Jost",
      fontSize = "10px")),
  xAxis = list(
    labels = list(
      style = list(
        fontFamily = "Jost",
        fontSize = "10px",
        fontWeight = "normal",
        textOverflow = 'none',
        color = "#fff")),
    title = list(
      style = list(
        color = "#fff",
        fontFamily = "Jost",
        fontWeight = "800",
        fontSize = "10px"))),
  yAxis = list(
    visible = FALSE,
    labels = list(
      style = list(
        fontFamily = "Jost",
        fontSize = "10px",
        fontWeight = "normal",
        color = "#fff")),
    title = list(
      style = list(
        color = "#fff",
        fontFamily = "Jost",
        fontWeight = "500",
        fontSize = "10px")))
)





silly_theme_2 <- hc_theme(
  colors = main_colors,
  chart = list(
    backgroundColor = NULL),
  style = list(
    fontFamily = "Sunflower"),
  title = list(
    style = list(
      color = "#fff",
      fontFamily = "Sunflower",
      fontWeight = "500",
      fontSize = "12px")),
  caption = list(
    style = list(
      color = "#fff",
      fontFamily = "Sunflower",
      fontSize = "10px")),
  xAxis = list(
    labels = list(
      style = list(
        fontFamily = "Sunflower",
        fontSize = "10px",
        fontWeight = "normal",
        textOverflow = 'none',
        color = "#fff")),
    title = list(
      style = list(
        color = "#fff",
        fontFamily = "Sunflower",
        fontWeight = "800",
        fontSize = "10px"))),
  yAxis = list(
    labels = list(
      style = list(
        fontFamily = "Sunflower",
        fontSize = "10px",
        fontWeight = "normal",
        color = "#fff")),
    title = list(
      style = list(
        color = "#fff",
        fontFamily = "Sunflower",
        fontWeight = "500",
        fontSize = "10px")))
)





silly_theme_3 <- hc_theme(
  colors = main_colors,
  chart = list(
    backgroundColor = NULL),
  style = list(
    fontFamily = "Teachers"),
  title = list(
    style = list(
      color = "#fff",
      fontFamily = "Teachers",
      fontWeight = "500",
      fontSize = "12px")),
  caption = list(
    style = list(
      color = "#fff",
      fontStyle = "italic",
      fontFamily = "Teachers",
      fontSize = "10px")),
  xAxis = list(
    labels = list(
      style = list(
        fontFamily = "Teachers",
        fontSize = "10px",
        fontWeight = "normal")),
    title = list(
      style = list(
        color = "#fff",
        fontFamily = "Teachers",
        fontWeight = "800",
        fontSize = "10px"))),
  yAxis = list(
    tickLength = 20,
    gridLineDashStyle = 'longdash',
    labels = list(
      style = list(
        fontFamily = "Teachers",
        fontSize = "10px",
        fontWeight = "normal",
        color = "#fff")),
    title = list(
      style = list(
        color = "#fff",
        fontFamily = "Teachers",
        fontWeight = "500",
        fontSize = "10px")))
)
