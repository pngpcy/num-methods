gaussian_elimination <- function(A,b){
  # this function reduces matrix to upper triangular form
  # using gaussian elimination
  
  # temp = c(7, 3, -1, 2, 3, 8, 1, -4, -1, 1, 4, -1, 2, -4, -1, 6)
  # A = matrix(temp, nrow = 4, byrow = TRUE)
  # b = c(-1, 0, -3, 1)
  # gaussian_elimination(A,b)
  
  # output is a list where list[1] is reduced A and list[2] is reduced B
  
  len_A = length(A[,1])
  len_b = length(b)


  A_aug = cbind(A,b)
  col_A_aug = length(A_aug[1,])
  for (i in seq.int(1, (len_A-1))){
    for (j in seq.int(len_A, (i+1))){
      fact = (A_aug[j,i]/A_aug[i,i])
      A_aug[j,i:col_A_aug] = A_aug[j,i:col_A_aug] - fact*A_aug[i,i:col_A_aug]
    }
  }
  result = list(A_aug[,1:len_A], A_aug[,col_A_aug])
}