## The makeCacheMatrix function takes a matrix from the user and the cacheSolve function calculates the inverse of it if there's not a inverse matrix already calculated or provided separately.



## makeCacheMatrix function sets a matrix, which can be pursed by get object. Sets a inverse matrix to null if already not calculated. And, that even can be pursed with getivrs element.After calling the matrix from the makeCacheMatrix, the cacheSolve function calculates the inverse matrix if the getinvrs element is still null. Otherwise, get the inverse matrix from cache.


## makeCacheMatrix function sets a matrix, which can be pursed by get object. Sets a inverse matrix to null if already not calculated. And, that even can be pursed with getivrs element.


makeCacheMatrix <- function(x = matrix()) {
my_invrs <- NULL
  set <- function(y) {
    x <<- y
    my_invrs <<- NULL
  }
  get <- function() x
  setinvrs <- function(inverse) my_invrs <<- inverse
  getinvrs <- function() my_invrs
  list(set = set, get = get,
       setinvrs = setinvrs,
       getinvrs = getinvrs)

}


## After calling the matrix from the makeCacheMatrix, the cacheSolve function calculates the inverse matrix if the getinvrs element is still null. Otherwise, get the inverse matrix from cache.n

cacheSolve <- function(x, ...) {
  my_invrs <- x$getinvrs()
  if(!is.null(my_invrs)) {
    message("getting cached data")
    return(my_invrs)
  }
  data <- x$get()
  my_invrs <- solve(data, ...)
  x$setinvrs(my_invrs)
  my_invrs

}
