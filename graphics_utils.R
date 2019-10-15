
if(!require("ggplot2")) 
    install.packages("ggplot2")

library("ggplot2")

normal_draw_right_tail_area<-function(x1,mu,sigma) {
    dnorm_full <- function(x) {
     y <- dnorm(x, mean=mu, sd=sigma)
     return(y)
    }

    dnorm_limit <- function(x) {
     y <- dnorm(x, mean=mu, sd=sigma)
     y[x < x1] <- NA
     return(y)
    }

    left = mu - 3.5*sigma;
    right = mu + 3.5*sigma;

    df <- data.frame(x=c(left, right))

    ggplot(df, aes(x=x)) +
    stat_function(fun=dnorm_limit, geom="area", fill="blue", alpha=0.5) +
    stat_function(fun=dnorm_full) +
    labs(x = "x", y = "") +
    geom_hline(yintercept=0) +
    scale_x_continuous(breaks = seq(left, right, by = sigma)) +
    # scale_x_continuous(breaks = seq(-3, 3, by = 1.0)) +
    # scale_y_continuous(breaks = seq(0, .4, by = 0.5)) +
    annotate("text", x = x1, y = -0.02, label = x1)

}

normal_draw_left_tail_area<-function(x1,mu,sigma) {
    dnorm_full <- function(x) {
     y <- dnorm(x, mean=mu, sd=sigma)
     return(y)
    }

    dnorm_limit <- function(x) {
     y <- dnorm(x, mean=mu, sd=sigma)
     y[x > x1] <- NA
     return(y)
    }

    left = mu - 3.5*sigma;
    right = mu + 3.5*sigma;

    df <- data.frame(x=c(left, right))

    ggplot(df, aes(x=x)) +
    stat_function(fun=dnorm_limit, geom="area", fill="blue", alpha=0.5) +
    stat_function(fun=dnorm_full) +
    labs(x = "x", y = "") +
    geom_hline(yintercept=0) +
    scale_x_continuous(breaks = seq(left, right, by = sigma)) +
    # scale_x_continuous(breaks = seq(-3, 3, by = 1.0)) +
    # scale_y_continuous(breaks = seq(0, .4, by = 0.5)) +
    annotate("text", x = x1, y = -0.02, label = x1)
}


z_draw_right_tail_area<-function(z) {

    dnorm_limit <- function(x) {
     y <- dnorm(x)
     y[x < z] <- NA
     return(y)
    }

    df <- data.frame(x=c(-3.5, 3.5))

    ggplot(df, aes(x=x)) +
    stat_function(fun=dnorm_limit, geom="area", fill="blue", alpha=0.5) +
    stat_function(fun=dnorm) +
    labs(x = "z", y = "") +
    geom_hline(yintercept=0) +
    scale_x_continuous(breaks = seq(-3, 3, by = 1.0)) +
    scale_y_continuous(breaks = seq(0, .4, by = 0.1)) +
    annotate("text", x = z, y = -0.02, label = z)
}

z_draw_left_tail_area <- function(z) {

    dnorm_limit <- function(x) {
     y <- dnorm(x)
     y[x > z] <- NA
     return(y)
    }

    df <- data.frame(x=c(-3.5, 3.5))

    ggplot(df, aes(x=x)) +
    stat_function(fun=dnorm_limit, geom="area", fill="blue", alpha=0.5) +
    stat_function(fun=dnorm) +
    labs(x = "z", y = "") +
    geom_hline(yintercept=0) +
    scale_x_continuous(breaks = seq(-3, 3, by = 1.0)) +
    scale_y_continuous(breaks = seq(0, .4, by = 0.1)) +
    annotate("text", x = z, y = -0.02, label = z)
}

z_draw_area_between <- function(z1,z2) {

    dnorm_limit <- function(x) {
     y <- dnorm(x)
     y[x < z1 | x > z2] <- NA
     return(y)
    }

    df <- data.frame(x=c(-3.5, 3.5))

    ggplot(df, aes(x=x)) +
    stat_function(fun=dnorm_limit, geom="area", fill="blue", alpha=0.5) +
    stat_function(fun=dnorm) +
    labs(x = "z", y = "") +
    geom_hline(yintercept=0) +
    scale_x_continuous(breaks = seq(-3, 3, by = 1.0)) +
    scale_y_continuous(breaks = seq(0, .4, by = 0.1)) +
    annotate("text", x = z2, y = -0.02, label = z2) +
    annotate("text", x = z1, y = -0.02, label = z1)
}

normal_draw_area_between <- function(x1,x2, mu, sigma){

    dnorm_full <- function(x) {
     y <- dnorm(x, mean=mu, sd=sigma)
     return(y)
    }

    dnorm_limit <- function(x) {
     y <- dnorm(x, mean=mu, sd=sigma)
     y[x < x1 | x > x2] <- NA
     return(y)
    }

    left = mu - 3.5*sigma;
    right = mu + 3.5*sigma;

    df <- data.frame(x=c(left, right))

    ggplot(df, aes(x=x)) +
    stat_function(fun=dnorm_limit, geom="area", fill="blue", alpha=0.5) +
    stat_function(fun=dnorm_full) +
    labs(x = "x", y = "") +
    geom_hline(yintercept=0) +
    scale_x_continuous(breaks = seq(left, right, by = sigma)) +
    # scale_y_continuous(breaks = seq(0, .4, by = 0.5)) +
    annotate("text", x = x2, y = -0.02, label = x2) +
    annotate("text", x = x1, y = -0.02, label = x1)
}
