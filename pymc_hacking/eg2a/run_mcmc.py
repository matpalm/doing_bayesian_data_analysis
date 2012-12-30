#!/usr/bin/env python
import simple_normal_model
from pymc import MCMC
from pymc.Matplot import plot

# do posterior sampling
m = MCMC(simple_normal_model)
m.sample(iter=500)
print(m.stats())

# draw some pictures
plot(m)
