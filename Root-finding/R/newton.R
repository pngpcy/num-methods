f <- function(x) x^2-3
d <- function(x) 2*x

newton <- function(f, d, Xn, nmax=100, tol=0.01){
# This function uses Newton method to find the root of an equation.
# temp = newton (f, d, 1, 10, 0.01)

X = {}
X = c(X, Xn)

for (i in seq.int(1,max)){
  temp = X[i] - f(X[i]) / d(X[i])
  X = c(X,temp)
  
  c = abs(f(X[i+1]))
  
  if (c < tol){
    break
  }
}

x = X[i+1]
}

