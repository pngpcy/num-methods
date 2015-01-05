f <- function(x) x^2-3

secant <- function(f,a,b,nmax=100, tol=0.01){
  # This function uses secant method to find the root of an equation.
  # result = secant (f, 1, 2,50, 0.01)
  X = {}
  X = c(a, b)
  
  for (n in seq.int(1,nmax)){
    temp = (X[n] * f(X[n+1]) - X[n+1] * f(X[n])) / (f(X[n+1]) - f(X[n]))
    X = c(X, temp)
    
    c = abs(f(X[n+2]))
    
    if (c<tol){
      break
    }
    
  }
  
  x = X[n+2]
}