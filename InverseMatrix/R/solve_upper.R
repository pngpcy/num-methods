solve_upper <- function(a,b){
  # solving triangular systems
  # given ax = b, where a is a square matrix and b is a nx1 matrix
  # find x where x is a nx1 matrix
    
  # temp = c(-2,1,2,1,0,3,-2,1,0,0,5,1,0,0,0,1)
  # a = matrix(temp,nrow=4,byrow=TRUE)
  # b = c(9,-1,8,2)
  # result = solve_upper(a,b)
  
  len = length(a[,1])
  x = matrix(0, nrow = 1, ncol = len)
  
  for (i in seq.int(len,1)){
    if (i == len){
      temp = (b[i] - a[i,i:len] %*% x[i:len])/a[i,i]  
    }else {
      temp = (b[i] - a[i,(i+1):len] %*% x[(i+1):len])/a[i,i]  
    }
    
    x[i] = temp
  }
  x = x 
}

