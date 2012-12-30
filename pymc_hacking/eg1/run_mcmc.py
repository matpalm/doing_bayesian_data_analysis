#!/usr/bin/env python
import simple_bernoulli_model
from pymc import MCMC
from pymc.Matplot import plot

# do posterior sampling
m = MCMC(simple_bernoulli_model)
m.sample(iter=100)
print(m.stats())

# draw some pictures
plot(m)
