# exercise 6.5

# prior

# prior is not uniform, it's fair to ensure it's somewhere nearer to zero than one
# and certainly not over, say, 0.5 (? is this justifiable...)
unnormalised_prior = c(50:1, rep(0, 50))
#plot(unnormalised_prior)
prior = unnormalised_prior / sum(unnormalised_prior)

width = 1 / length(unnormalised_prior)
theta = seq(width/2, 1-width/2, width)

# likelihood

defective = 28
non_defective = 500 - defective
data = c(rep(1, defective), rep(0, non_defective))

# posterior

post = BernGrid(theta, prior, data)

# 95% hdi 0.045 -> 0.075
# so defective rate < 0.1 is reasonable
