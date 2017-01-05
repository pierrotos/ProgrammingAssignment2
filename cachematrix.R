## The cachematrix.R file contains two functions.The firt is: makeCacheMatrix() and the second: cacheSolve().The first one creates an R 
## object that stores a matrix and its inverse matrix (with the function: solve()). The second function requires an argument that is
## returned by makeCacheMatrix() in order to retrieve the inverse matrix from the cached value that is stored in the makeCacheMatrix() 
## objects environment. 

## We use this four functions so as to create a matrix, find its inverse matrix and save it in case we need it again later. 

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setsolve <- function(solve) m <<- solve
    getsolve <- function() m
    list(set = set, get = get, 
         setsolve = setsolve,
         getsolve = getsolve)
}


## After creating the above function, when we try to find the inverse matrix for a second time we will be informed with a 
## specific message that in our first time the result has been saved so now we don't need to make the calculations again.  

cacheSolve <- function(x, ...) {
    m <- x$getsolve()
    if(!is.null(m)) {
        message("I am getting cached data sir")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setsolve(m)
    m
        
}
