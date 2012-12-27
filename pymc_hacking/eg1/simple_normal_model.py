#!/usr/bin/env python
from pymc import *

mean = Uniform('mean', lower=0.0, upper=20.0)
precision = Uniform('precision', lower=0.0, upper=1.0)

data = map(float, open('data', 'r').readlines())

process = Normal('process', mu=mean, tau=precision, value=data, observed=True)
