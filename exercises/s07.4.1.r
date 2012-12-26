# s7.4.1

library(rjags)

flips = c(rep(1,11), rep(0,3))

model = jags.model('s07.4.1.model',
                   data=list(nFlips=length(flips), y=flips))

update(model, 2000)

s = jags.samples(model, c('theta'), 100)

s$theta
# 0.76