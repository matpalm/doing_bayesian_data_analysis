#!/usr/bin/env python
data = map(float, open('data', 'r').readlines())
print float(sum(data)) / len(data)
