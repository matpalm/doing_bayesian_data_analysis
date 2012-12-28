#!/usr/bin/env python
from pymc import *

theta = Uniform('theta', lower=0.0, upper=1.0)
data = map(float, open('data', 'r').readlines())

process = Bernoulli('process', p=theta, value=data, observed=True)
