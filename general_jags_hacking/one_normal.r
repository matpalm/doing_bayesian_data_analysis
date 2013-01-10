library(ggplot2)
library(rjags)

data = rnorm(50, mean=100, sd=10)
orig_p = ggplot(data.frame(d=data), aes(d)) + geom_density() + opts(title="original")

model = jags.model('one_normal.model',
                   data=list(N=length(data), x=data))
update(model, 2000)

#s = jags.samples(model, c('theta'), 1000)
sample = coda.samples(model, c('mu', 'sigma'), 100)

# plot
df = as.data.frame(sample[[1]])
mu_p = ggplot(df, aes(mu)) + geom_density() + opts(title="mu")
sigma_p = ggplot(df, aes(sigma)) + geom_density() + opts(title="sigma")

library(gridExtra)
grid.arrange(orig_p, mu_p, sigma_p)
