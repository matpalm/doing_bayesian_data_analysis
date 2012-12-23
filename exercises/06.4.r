# exercise 6.4

trial_1.a = 58
trial_1.b = 100 - prefer_a
trial_1.data = c(rep(1, trial_1.a), rep(0, trial_1.b))

# a) 

prior = rep(1, 100)
prior = prior / sum(prior)

width = 1 / length(unormalised_theta)
theta = seq(width/2, 1-width/2, width)

trial_1.post = BernGrid(theta, prior, trial_1.data)

# b)
# 95% hdi 0.483 -> 0.673
# so, yes, it could be population evenly divided (ie 0.5 is in HDI range)

# c)

trial_2.a = 57
trial_2.b = 100 - trial_2.a
trial_2.data = c(rep(1, trial_1.a), rep(0, trial_1.b))

post_2 = BernGrid(theta, trial_1.post, trial_2.data)

# d)

# 95% hdi not 0.511 -> 0.646
# so, no, no longer beliebe population is evenly divided (ie 0.5 not longer in HDI range)