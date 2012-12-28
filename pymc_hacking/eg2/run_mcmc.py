#!/usr/bin/env python
import simple_normal_model
from pymc import MCMC
from pymc.Matplot import plot

# do posterior sampling
M = MCMC(simple_normal_model)
M.sample(iter=500)
print(M.stats())

# draw some pictures
plot(M)
