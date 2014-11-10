## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL
  
  set <- function(y) {
    print("shit")
    x <<- y
    inverse <<- NULL
  }
  get<-function() x
  
  getInverse<-function() inverse
  setInverse <- function(inv) inverse <<- inv
  
  list(set=set, get=get, getInverse=getInverse, setInverse=setInverse)
  
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getInverse()
  if (!is.null(inv)){
    message("getting cached data")
    return(inv)
  }
  
  matrix <- x$get()
  m <- solve(matrix)
  x$setInverse(m)
  return(m)
}


#in.matrix <- matrix(1:16, c(4,4))
in.matrix <- matrix(c(2,3,3,1), c(2,2))
m <- makeCacheMatrix(in.matrix)
cacheSolve(m)

