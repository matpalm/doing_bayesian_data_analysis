#!/usr/bin/env python
from pymc import *
from math import sqrt

# cf. http://stats.stackexchange.com/questions/46626/fitting-model-for-two-normal-distributions-in-pymc
# thanks @Cmrn_DP

data = map(float, open('data', 'r').readlines())

theta = Uniform("theta", lower=0, upper=1)
ber = Bernoulli("ber", p=theta, size=len(data))

mean1 = Uniform('mean1', lower=min(data), upper=max(data))
mean2 = Uniform('mean2', lower=min(data), upper=max(data))
std_dev = Uniform('std_dev', lower=0, upper=50)

@deterministic(plot=False)
def mean(ber=ber, mean1=mean1, mean2=mean2):
    return ber * mean1 + (1 - ber) * mean2

@deterministic(plot=False)
def precision(std_dev=std_dev):
    return 1.0 / (std_dev * std_dev)

process = Normal('process', mu=mean, tau=precision, value=data, observed=True)
