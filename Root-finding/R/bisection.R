f <- function(x) x^2-3

biSection <- function(f, a, b, max=100, tol=0.01){
  # This function uses Bisection method to find the root of an equation.
  # result = biSection (f, 1, 2,50, 0.01)
  
  for (i in seq.int(1,max)) {
    c = (a+b)/2
    
    if (f(c)*f(a) > 0) {
      a = c
    }else {
      b = c
    }
    
    if (abs(f(c)) <= tol){
      break
    }
  }
  
  x = (a+b)/2
}