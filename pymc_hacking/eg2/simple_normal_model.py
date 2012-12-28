#!/usr/bin/env python
from pymc import *

mean = Uniform('mean', lower=0.0, upper=200.0)
precision = Gamma('precision', alpha=0.1, beta=0.1)
data = map(float, open('data', 'r').readlines())

process = Normal('process', mu=mean, tau=precision, value=data, observed=True)
