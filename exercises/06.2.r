# exercise 6.2

# a)

unormalised_theta = c(100:1, rep(1,100), 1:100, 100:1, rep(1,100), 1:100)
plot(unormalised_theta)

width = 1 / length(unormalised_theta)
theta = seq(width/2, 1-width/2, width)

p_theta = unormalised_theta / sum(unormalised_theta)

# b)

trials = 20
heads = 15
data = c(rep(1, heads), rep(0, trials-heads))

BernGrid(theta, p_theta, data)
