# s7.4.1
library(ggplot2)
library(rjags)

flips = c(rep(1,11), rep(0,3))

model = jags.model('s07.4.1.model',
                   data=list(nFlips=length(flips), y=flips))

update(model, 2000)

#s = jags.samples(model, c('theta'), 1000)
sample = coda.samples(model, c('theta'), 100)

# plot
df = as.data.frame(sample[[1]])
ggplot(df, aes(theta)) + geom_density() + xlim(0, 1)

# > str(s)
# List of 1
# $ : mcmc [1:100, 1] 0.721 0.752 0.66 0.633 0.662 ...
# ..- attr(*, "dimnames")=List of 2
# .. ..$ : NULL
# .. ..$ : chr "theta"
# ..- attr(*, "mcpar")= num [1:3] 2001 2100 1
# - attr(*, "class")= chr "mcmc.list"

# first element in list
# > str(s[[1]])
# mcmc [1:100, 1] 0.721 0.752 0.66 0.633 0.662 ...
# - attr(*, "dimnames")=List of 2
# ..$ : NULL
# ..$ : chr "theta"
# # - attr(*, "mcpar")= num [1:3] 2001 2100 1
