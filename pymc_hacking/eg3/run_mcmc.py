#!/usr/bin/env python
import two_normal_model
from pymc import MCMC
from pymc.Matplot import plot

# do posterior sampling
M = MCMC(two_normal_model)
M.sample(iter=100000, burn=1000, thin=20)

# draw some pictures
plot(M)
