### Generate Figures in paper
# Author: Gian Carlo Diluvi
# UBC
### ### ### ### ### ### ### ### ### ### ###

# Preamble ####
library(tidyverse)
library(ggplot2)
ggplot2::theme_set(theme_classic())


# Prior/posterior 1 ####
x <- seq(from=0, to=10, by=0.05)
myfun <- function(x) exp(-3*x-1) - 2*log(1+4*(x/20)^2) + sin(1.1*x)
y <- myfun(x)

real <- tibble(x = x,
               y = y)

ggplot(data.frame(x, y), aes(x, y))+
  geom_line()

# Observed values
xobs <- seq(from=0, to=10, by=2)
yobs <- myfun(xobs)

observed <- tibble(x = xobs,
                   y = yobs)

# Covariance matrix
kappa <- function(x1, x2) {
  n1 <- length(x1)
  n2 <- length(x2)
  
  K <- matrix(rep(0, n1*n2), nrow=n1)
  
  for(i in 1:n1){
    for(j in 1:n2){
      K[i, j] <- exp(-0.5 * abs(x1[i] - x2[j])^2)
    }
  }
  
  return(K)
  
}

# Predicted values
f_predict <- function(x, xobs, yobs){
  
  pred_mean <- kappa(x, xobs) %*% solve(kappa(xobs, xobs)) %*% yobs
  pred_cov <- kappa(x, x) - kappa(x, xobs) %*% solve(kappa(xobs, xobs)) %*% kappa(xobs, x)
  
  return(list(mean = pred_mean, covariance = pred_cov))
}

xpred <- seq(from=0, to=10, by=0.05)
fpred <- f_predict(xpred, xobs, yobs)

predicted <- tibble(x = xpred,
                    y = fpred$mean,
                    ymin = y - 1.96*sqrt(diag(fpred$covariance)),
                    ymax = y + 1.96*sqrt(diag(fpred$covariance)))

# Plot
ggplot() +
  geom_line(data=real, aes(x, y),
            linetype = 2,
            size = 0.75) +
  geom_point(data=observed, aes(x, y),
             shape=2,
             size=4) +
  geom_line(data=predicted, aes(x, y),
            linetype = 1,
            color = "grey20",
            alpha=0.75) +
  geom_ribbon(data=predicted, aes(x = x, ymin=ymin, ymax=ymax),
              fill="grey70",
              alpha=0.5) +
  labs(x = expression(t),
       y = expression(X[t])) +
  theme(axis.text.x = element_text(size=16),
        axis.title.x = element_text(size=18),
        axis.text.y = element_text(size=16),
        axis.title.y = element_text(size=18))

ggsave(filename = "GP1.pdf")
