## A set of functions that can cache a matrix inverse
## and return it if the original matrix is not modified.

## A special "matrix" capable of caching it's inverse.

makeCacheMatrix <- function(x = matrix()) {
	i <- NULL
	set <- function(y) {
		x <<- y
		m <<- NULL
	}
	get <- function() x
	setinverse <- function(inverse) i <<- inverse
	getinverse <- function() i

	list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}


## A function that returns the cached inverse of a "special"
## matrix if it exists, otherwise it calculates the inverse and
## returns it.

cacheSolve <- function(x, ...) {
	## Return a matrix that is the inverse of 'x'
	i <- x$getinverse()
	if(!is.null(i)) {
		message("Getting cached inverse matrix.")
		return(m)
	}
	data <- x$get()
	i <- solve(data,...)
	i
}
