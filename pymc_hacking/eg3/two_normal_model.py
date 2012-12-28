#!/usr/bin/env python
from pymc import *

# cf. http://stats.stackexchange.com/questions/46626/fitting-model-for-two-normal-distributions-in-pymc
# thanks @Cmrn_DP

data = map(float, open('data', 'r').readlines())

theta = Uniform("theta", 0, 1)
ber = Bernoulli("ber", p=theta, size=len(data))

mean1 = Normal("mean1", 0, 0.001)
mean2 = Normal("mean2", 0, 0.001)
precision = Gamma('precision', alpha=0.1, beta=0.1)

@deterministic(plot=False)
def mean(ber=ber, mean1=mean1, mean2=mean2):
    return ber * mean1 + (1 - ber) * mean2

process = Normal('process', mu=mean, tau=precision, value=data, observed=True)
