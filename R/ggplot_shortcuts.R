#' @export
scale_fill_movie <- function(name, ...) {
  ggplot2::scale_fill_manual(values = my_pal(name), ...)
}

#' @export
scale_color_movie <- function(name, ...) {
  ggplot2::scale_color_manual(values = my_pal(name), ...)
}
