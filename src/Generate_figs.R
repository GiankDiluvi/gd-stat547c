# Exchangeability in dependence modelling
# Author: Gian Carlo Diluvi
# Department of Statistics, UBC
# STAT 547, Winter 2019
###
# Supplementary code for generating Figures
### ### ### ### ### ### ### ### ### ### ### ###

# Preamble ####
# Install these packages if you haven't!
library(tidyverse)
library(ggplot2)
ggplot2::theme_set(theme_classic())
### ### ### ### ### ### ### ###

# Define covariance matrix kappa ####
# Use standard squared exponential
kappa <- function(x1, x2) {
  # Function accepts vectors
  # x1 in Rn1, x2 in Rn2
  n1 <- length(x1)
  n2 <- length(x2)
  
  # Initialize matrix
  K <- matrix(rep(0, n1*n2), nrow=n1)
  
  for(i in 1:n1){
    for(j in 1:n2){
      K[i, j] <- exp(-0.5 * abs(x1[i] - x2[j])^2) #Sq. exp
    }
  }
  return(K)
}
### ### ### ### ### ### ### ###



# Define prediction function ####
f_predict <- function(x, xobs, yobs){
  # Predict f(x) given xobs, yobs
  # Can be vector-valued
  
  pred_mean <- kappa(x, xobs) %*% solve(kappa(xobs, xobs)) %*% yobs
  pred_cov <- kappa(x, x) - kappa(x, xobs) %*% solve(kappa(xobs, xobs)) %*% kappa(xobs, x)
  
  # Return conditional mean and variance
  return(list(mean = pred_mean, covariance = pred_cov))
}
### ### ### ### ### ### ### ###


# Figure 1 (GP regression) ####

# Define random function and generate observations (x, y)
x <- seq(from=0, to=10, by=0.05)
myfun <- function(x) exp(-3*x-1) - 2*log(1+4*(x/20)^2) + sin(1.1*x)
y <- myfun(x)

real <- tibble(x = x,
               y = y)
# Here's how the function looks like:
ggplot(data.frame(x, y), aes(x, y))+
  geom_line()

# Generate observed values (equidistanced in domain) (xobs, yobs)
xobs <- seq(from=0, to=10, by=2)
yobs <- myfun(xobs)

observed <- tibble(x = xobs,
                   y = yobs)


# Generate values to be predicted (thin grid in domain) (xpred, fpred)
xpred <- seq(from=0, to=10, by=0.05)
fpred <- f_predict(xpred, xobs, yobs)

predicted <- tibble(x = xpred,
                    y = fpred$mean,
                    ymin = y - 1.96*sqrt(diag(fpred$covariance)),
                    ymax = y + 1.96*sqrt(diag(fpred$covariance)))

# Plot everything together and save ###
ggplot() +
  geom_line(data=real, aes(x, y),
            linetype = 2,
            size = 0.85) +
  geom_point(data=observed, aes(x, y),
             shape=2,
             size=4) +
  geom_line(data=predicted, aes(x, y),
            linetype = 1,
            color = "black",
            alpha=0.9) +
  geom_ribbon(data=predicted, aes(x = x, ymin=ymin, ymax=ymax),
              fill="grey70",
              alpha=0.5) +
  labs(x = expression(t),
       y = expression(X[t])) +
  theme(axis.text.x = element_text(size=16),
        axis.title.x = element_text(size=18),
        axis.text.y = element_text(size=16),
        axis.title.y = element_text(size=18))

ggsave(filename = "GP1.pdf") # This is Figure 1
### ### ### ### ### ### ### ###