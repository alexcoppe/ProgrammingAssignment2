#Matrix inversion is usually a costly computation and their may be some benefit to
#caching the inverse of a matrix rather than compute it repeatedly.
#This module contains 2 functions:
#makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
#cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.
#If the inverse has already been calculated  then the cachesolve retrieves the inverse from the cache


#cacheSolve creates a special matrix which in reality is a list containing 4 functions to:
#set the value of the matrix
#get the value of the matrix
#set the inverse of the matrix
#get the inverse of the matrix
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



#The cacheSolve function calculates the inverse of the special matrix created with makeCacheMatrix.
#It first checks to see if the inverse has already been calculated.
#If so, it gets the inverse from the cache and skips the computation. Otherwise,  it calculates the inverse
#and caches the result
cacheSolve <- function(x, ...) {
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


#This chunk of code is for testing pourpose
in.matrix <- matrix(c(2,3,3,1), c(2,2))
m <- makeCacheMatrix(in.matrix)
inverse.matrix <- cacheSolve(m)

