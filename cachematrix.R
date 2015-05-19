## The below functions perform a cached matrix inversion

## makeCacheMatrix() - Function to create the matrix

makeCacheMatrix <- function(mat = matrix()) {
    
    inv <- NULL
    
    set <- function(y) {
        mat <<- y   
        inv <<- NULL
    }
    
    get <- function() mat
    
    setinv <- function(p_inv) inv <<- p_inv
    
    getinv <- function() inv
    
    list (set = set, get = get,
          setinv = setinv,
          getinv = getinv)
    
}


## cacheSolve() - function to perform inverse of matrix

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    invmat <- x$getinv()
    
    if(!is.null(invmat)) {
        message ("Getting cached data...")
        return (invmat)
    }
    mat <- x$get()
    invmat <- solve(mat)
    cm$setinv(invmat)
    invmat
}
