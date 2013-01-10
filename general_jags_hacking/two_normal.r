library(ggplot2)
library(rjags)
library(gridExtra)

# generate test data
data0 = rnorm(50, mean=100, sd=10)
data1 = rnorm(50, mean=200, sd=10)

# build model
model = jags.model('two_normal.model',
                   data=list(N=length(data), x0=data0, x1=data1))
update(model, 2000)

# sample
sample = coda.samples(model, c('mu0', 'mu1', 'sigma'), 100)

# plot it all

df0 = data.frame(d=data0, type='d0')
df1 = data.frame(d=data1, type='d1')
df = rbind(df0, df1)
orig_p = ggplot(df, aes(d)) + 
  geom_density(aes(color=type)) + 
  geom_vline(xintercept=100, colour="red") +
  geom_vline(xintercept=200, colour="cyan") +
  theme(legend.position = "none") +
  opts(title="actual") + xlim(50, 250)

df = as.data.frame(sample[[1]])
mus_p = ggplot(df) + 
  geom_density(aes(mu0), colour="red") + geom_vline(xintercept=100, colour="red") +
  geom_density(aes(mu1), colour="cyan") + geom_vline(xintercept=200, colour="cyan") +
  opts(title="mus") + xlim(50, 250)

sigma_p = ggplot(df, aes(sigma)) + 
  geom_density() + geom_vline(xintercept=10) +
  opts(title="sigma") + xlim(5, 15)

png("two_normal.png", width = 1000, height = 600)
grid.arrange(orig_p, mus_p, sigma_p)
dev.off()