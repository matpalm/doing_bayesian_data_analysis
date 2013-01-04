# s8.5
library(ggplot2)
library(rjags)

y1 = c(1,1,1,1,1,1,1,0,0,0)  # 7/10
y2 = c(1,1,1,0,0,0,0,0,0,0)  # 3/10

# sampling from the prior
# note: no refs to y1 or y2
model = jags.model('s08.5.model',
                   data=list(N1=length(y1),
                             N2=length(y2)))

update(model, 50000)
sample = coda.samples(model, c('theta1', 'theta2'), 10000)

png("s08.5.prior.png", width = 600, height = 600)
df = as.data.frame(sample[[1]])
ggplot(df, aes(theta1, theta2)) + geom_bin2d()
dev.off()

# sampling from the posterior
model = jags.model('s08.5.model',
                   data=list(N1=length(y1), y1=y1,
                             N2=length(y2), y2=y2))

update(model, 50000)
sample = coda.samples(model, c('theta1', 'theta2'), 10000)

png("s08.5.posterior.png", width = 600, height = 600)
df = as.data.frame(sample[[1]])
ggplot(df, aes(theta1, theta2)) + geom_bin2d()
dev.off()

# s08.6, theta difference
png("s08.6.theta_diff.png", width = 600, height = 300)
ggplot(df, aes(theta1-theta2)) + geom_histogram()
dev.off()