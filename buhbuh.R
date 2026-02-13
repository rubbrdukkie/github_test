# We just needed a script for demonstration purposes
x <- y <- seq(-2, 2, length.out = 1200)
c <- outer(x, y, function(a, b) complex(real = a, imaginary = b))
z <- c
nM <- matrix(0, length(x), length(y))

for (i in 1:60) {
  z <- z^2 + c
  nM[nM == 0 & abs(z) > 2] <- i
}

# Note that the black areas are actually part of the Mandelbrot set
# The boundary of the Mandelbrot set is a fractal curve
# No matter how much you zoom in, the boundary stays "rough" 
image(x, y, nM, col = hcl.colors(50, "Inferno"), useRaster = TRUE)