f <- function(x) x^2-3

muller <- function(f,X1,X2,X3,nmax=100,tol=0.01){
  # This function uses Muller method to find the root of an equation.
  # result = muller (f, -1, 1, 3, 10, 0.01)
  
  X = c(X1,X2,X3)

  for (n in seq.int(1,nmax)){
    temp = c((X[n] - X[n+1])^2, (X[n] - X[n+1]),1, 0, 0, 1, (X[n+2] - X[n+1])^2, (X[n+2] - X[n+1]),1)
    v_matrix = matrix(temp, nrow=3, byrow=TRUE)
    
    right_matrix = c(f(X[n]), f(X[n+1]), f(X[n+2]))
    
    middle_matrix = (solve(v_matrix)) %*% right_matrix
    
    a = middle_matrix[1]
    b = middle_matrix[2]
    c = middle_matrix[3]
    
    temp = X[2] + ((-2*c) / (b + (sign(b) * sqrt(b^2 - 4 * a * c ) ) ) )
    
    if (abs(f(temp)) < tol){
      break
    }
    
    X = c(X[2], X[3], temp)
  }
  
  x = temp;
}