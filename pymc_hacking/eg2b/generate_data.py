#!/usr/bin/env python
from numpy.random import normal
data = [normal(100, 20) for _i in xrange(1000)]
with open("data", "w") as f:
    for data_point in data:
        print >>f, data_point

from pylab import hist, savefig
hist(data, 20)
savefig("data.png")
