#!/usr/bin/env python
from numpy.random import normal
import random

data = [normal(100, 20) for _i in xrange(500)]
data += [normal(200, 20) for _i in xrange(500)]
random.shuffle(data)

with open("data", "w") as f:
    for data_point in data:
        print >>f, data_point

from pylab import hist, savefig
hist(data, 20)
savefig("data.png")
