#!/usr/bin/env python

import simple_normal_model
from pymc import MCMC
import numpy as np
from math import *

# do posterior sampling
M = MCMC(simple_normal_model)
M.sample(iter=500)  # , burn=50)

# write some stats out
print "mean median", np.median(M.trace('mean')[:])
median_precision = np.median(M.trace('precision')[:])
print "precision median", median_precision, "(std dev", sqrt(1.0 / median_precision), ")"

# and draw some pictures
from pymc.Matplot import plot
plot(M)
