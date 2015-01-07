solve_lower <- function(a,b){
  # solving triangular systems
  # given ax = b, where a is a square matrix and b is a nx1 matrix
  # find x where x is a nx1 matrix
  
  # temp = c(-2, 0, 0, 0,1 ,3,0, 0, 5, 1, 5, 0, 1, 2, 1, 3)
  # a = matrix(temp,nrow=4,byrow=TRUE)
  # b = c(9,-1,8,2)
  # result = solve_lower(a,b)
  
  len = length(a[,1])
  x = matrix(0, nrow = 1, ncol = len)
  
  for (i in seq.int(1,len)){
    if (i == len){
      temp = (b[i] - a[i,1:i] %*% x[1:i])/a[i,i]  
    }else {
      temp = (b[i] - a[i,1:(i-1)] %*% x[1:(i-1)])/a[i,i]  
    }
    
    x[i] = temp
  }
  x = x 
}

