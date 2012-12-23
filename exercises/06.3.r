# exercise 6.3

# a)

# prior

unormalised_theta = c(100:1, rep(1,100), 1:100, 100:1, rep(1,100), 1:100)
plot(unormalised_theta)
width = 1 / length(unormalised_theta)
theta = seq(width/2, 1-width/2, width)
prior1 = unormalised_theta / sum(unormalised_theta)

trials = 4
heads = 3
data = c(rep(1, heads), rep(0, trials-heads))

post1 = BernGrid(theta, prior1, data)

# b)

trials = 16
heads = 12
data = c(rep(1, heads), rep(0, trials-heads))

post2 = BernGrid(theta, post1, data)