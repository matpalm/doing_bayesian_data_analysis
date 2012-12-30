#!/usr/bin/env python
import simple_normal_model
from pymc import MCMC
from pymc.Matplot import plot

# do posterior sampling
m = MCMC(simple_normal_model)
m.sample(iter=500)
print(m.stats())

# dump some traces
import numpy
for p in ['mean', 'std_dev']:
    numpy.savetxt("%s.trace" % p, m.trace(p)[:])

# draw some pictures
plot(m)
