library(tidyverse)

# function estimating pi, returns the estimated value
estimate_pi <- function(seed = 28, iterations = 1000){
    # set seed for reproducibility
    set.seed(seed)
    
    # generate the (x, y) points
    x <- runif(n = iterations, min = 0, max = 1)
    y <- runif(n = iterations, min = 0, max = 1)
    
    # calculate distance to center
    sum_sq_xy <- sqrt(x^2 + y^2) 
    
    # see how many points are within circle
    index_within_circle <- which(sum_sq_xy <= 1)
    points_within_circle = length(index_within_circle)
    
    # estimate pi
    pi_est <- 4 * points_within_circle / iterations
    return(pi_est)
}

# get estimated value of pi for 100,000 points
estimate_pi(seed = 28, iterations = 100000)


# estimate pi for different number of points, using sapply
no_of_iterations <- c(10, 100, 1000, 10000, 100000, 1000000)
res <- sapply(no_of_iterations, function(n)estimate_pi(iterations = n))
names(res) <- no_of_iterations
res


# function estimating pi and storing points and each estimation of pi in a dataframe
est_pi_data <- function(seed=28, iterations = 1000) {
    set.seed(seed)
    
    # store generated points in a data frame
    df <- data.frame(x <- runif(n = iterations, min = -1, max = 1),
                     y <- runif(n = iterations, min = -1, max = 1))
    
    # add a column to index the number of iterations
    df$iteration <- 1:iterations
    
    # add column to identify if point falls within circle
    df$points_within_circle <- ifelse(sqrt(x^2 + y^2) <= 1, 1, 0) 
    
    # estimate pi
    df$pi_est <- 4 * cumsum(df$points_within_circle) / df$iteration
    
    return(df)
}


# generate estimation data for 1,000,000 points
pi_data <- est_pi_data(seed = 28, iterations = 1000000)

# plot showing estimated pi as number of points increases
ggplot(pi_data, aes(x = iteration, y = pi_est)) +
    geom_line(col = "blue") +
    geom_hline(yintercept = pi) +
    ylim(c(3, 3.3)) +
    labs(title = expression(paste("Approximation of ", pi)),
         x = "number of points",
         y = expression(paste("estimated value of ",pi)))
