#!/usr/bin/env python
from pymc import *

data = map(float, open('data', 'r').readlines())
mean = Uniform('mean', lower=min(data), upper=max(data))
std_dev = Uniform('std_dev', lower=0, upper=50)

@deterministic(plot=False)
def precision(std_dev=std_dev):
    return 1.0 / (std_dev * std_dev)

process = Normal('process', mu=mean, tau=precision, value=data, observed=True)
