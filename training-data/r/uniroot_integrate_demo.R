# Numerical root finding, integration and 1-D optimisation from base R.
f <- function(x) x^2 - 2
root <- uniroot(f, lower = 0, upper = 2, tol = 1e-9)
print(round(root$root, 6))

area <- integrate(function(x) x^2, lower = 0, upper = 3)
print(round(area$value, 6))

gauss <- integrate(dnorm, -Inf, Inf)
print(round(gauss$value, 6))

best <- optimize(function(x) (x - 3)^2 + 1, interval = c(-10, 10))
print(round(best$minimum, 4))
print(round(best$objective, 4))

peak <- optimize(function(x) sin(x), interval = c(0, pi), maximum = TRUE)
print(round(peak$maximum, 4))
