# exercise 6.6

width = 1/100 
theta = seq(width/2, 1-width/2, width)

unormalised_prior = theta ^ 2
prior = unormalised_prior / sum(unormalised_prior)

post = BernGrid(theta, prior, c(1,1,0,0))

probability_next_head = sum(theta * post)
probability_next_head
# 0.625