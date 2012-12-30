#!/usr/bin/env python
from pymc import *

data = map(float, open('data', 'r').readlines())
theta = Uniform('theta', lower=0.0, upper=1.0)
process = Bernoulli('process', p=theta, value=data, observed=True)
