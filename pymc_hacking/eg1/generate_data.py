#!/usr/bin/env python
from numpy.random import normal
data = [normal(10, 2) for _i in xrange(1000)]
with open("data", "w") as f:
    for data_point in data:
        print >>f, data_point

from pylab import hist, savefig
hist(data)
savefig("data.png")
