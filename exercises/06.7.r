# exercise 6.6

# estimation grid
width = 1/100 
theta = seq(width/2, 1-width/2, width)

# likelihood
z = 6  # num heads
N = 8  # total num trials
pDataGivenTheta = theta ^ z * (1 - theta) ^ (N - z)

# model priors
normalise <- function(x) return(x / sum(x))
model1.prior = normalise(theta ^ 2)
model2.prior = normalise((1-theta) ^ 2)

# prob of data under both
model1.pData = sum(pDataGivenTheta * model1.prior)
model2.pData = sum(pDataGivenTheta * model2.prior)

# bayes factor
bayes_factor = model1.pData / model2.pData
bayes_factor
