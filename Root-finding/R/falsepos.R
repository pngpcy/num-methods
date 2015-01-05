f <- function(x) x^2-3

falsepos <- function(f,a,b,nmax=100, tol = 0.01){
  # This function uses false position method to find the root of an equation.
  # result = falsepos (f, 1, 2, 10, 0.01)
  
  for (i in seq.int(1,nmax)){
    c = (a*f(b)-b*f(a)) / (f(b) - f(a))
    
    if (f(a)*f(c) > 0){
      a = c  
    } else {
      b = c
    } 
    
    if (abs(f(c)) < tol){
      break
    } 
  }
  
  c = (a*f(b)-b*f(a)) / (f(b) - f(a));  
}

