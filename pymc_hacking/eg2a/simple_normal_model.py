#!/usr/bin/env python
from pymc import *

data = map(float, open('data', 'r').readlines())
mean = Uniform('mean', lower=min(data), upper=max(data))
precision = Uniform('precision', lower=0.0001, upper=1.0)
process = Normal('process', mu=mean, tau=precision, value=data, observed=True)
