#' @export
my_pal <- function(name, n, type = c("discrete", "continuous")) {
  type <- match.arg(type)
  pal <- my_colors[[name]]

  if (is.null(pal)) stop("Palette not found! Check your spelling.")

  if (missing(n)) {
    n <- length(pal)
  }

  out <- switch(type,
                continuous = grDevices::colorRampPalette(pal)(n),
                discrete = pal[1:n]
  )

  structure(out, class = "palette", name = name)
}

#' @export
print.palette <- function(x, ...) {
  n <- length(x)
  old <- graphics::par(mar = c(0, 0, 0, 0))
  on.exit(graphics::par(old))
  graphics::image(1:n, 1, as.matrix(1:n), col = x,
                  ylab = "", xaxt = "n", yaxt = "n", bty = "n")
  graphics::rect(0, 0.9, n + 1, 1.1, col = grDevices::rgb(1, 1, 1, 0.8), border = NA)
  graphics::text((n + 1) / 2, 1, labels = attr(x, "name"), cex = 2, family = "serif")
}
