## Description of the functions
# makeCacheMatrix and cacheSolve are two functions working together to evaluate 
# a matrix, calculate the inverse, store the inverse in memory, evaluate if the 
# inverse of a matrix has already been calculated and in this case retrieve the 
# result from memory instead of recalculating the inverse. 
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}


makeCacheMatrix <- function(x = matrix()) {    # function of x in which x is by default a matrix
        m <- NULL                              # sets m to NULL in the function (in this function call it level 1a)
        set <- function(y) {                   # set is a function to reset x and m
                x <<- y                        # sets x to be y outside this function in the parent environment (level 1a)
                m <<- NULL                     # sets m to NULL outside this function in the parent environment (same level as m before, level 1a)
        }
        get <- function() x                    # sets get to return x (the matrix), needs to be a function because its called in cacheSolve
        setinverse <- function(solve) m <<- solve # 
        getinverse <- function() m             # sets getinverse to return m (from level 1a)
        list(set = set, get = get,             # list that stores the matrix, inversed matrix etc
             setinverse = setinverse,
             getinverse = getinverse)        
}



cacheSolve <- function(x, ...) {              # function of x (still our matrix)
        m <- x$getinverse()                   # sets m in this function to be the results from getinverse (m set on level 1b)
        if(!is.null(m)) {                     # if there is an m defined in memory (m not NULL) this function
                message("getting cached data")# returns the message
                return(m)                     # and returns m 
        }                                     # otherwise
        data <- x$get()                       # we define data which is none other than our matrix (see above get returns x) 
        m <- solve(data, ...)                 # define m as the inverse of the matrix (solve(matrix))
        x$setinverse(m)                       # place the inverse in the cache (level 1a)
        m                                     # and return it at the same time
}