
setwd("~/dev/doing_bayesian_data_analysis/pymc_hacking/eg3/")

d = read.delim("data", h=F, col.names=c("value"))
png("data.eg3.png", width = 600, height = 300)
ggplot(d, aes(value)) + geom_histogram()
dev.off()

read_trace <- function(name) {
  filename = paste(name, ".trace", sep="")
  df = read.delim(filename, h=F, col.names=c("value"))
  df$type = name
  df$sample = 1:nrow(df)
  return(df)
}

mean1 = read_trace("mean1")
mean2 = read_trace("mean2")
sd = read_trace("std_dev")
df = rbind(mean1, mean2, sd)
png("traces.eg3.png", width = 600, height = 300)
ggplot(df, aes(sample, value)) + 
  geom_line(aes(color=type), size=1) + 
  ylim(0, max(df$value))
dev.off()

df = read_trace("theta")
png("trace.theta.png", width = 600, height = 300)
ggplot(df, aes(sample, value)) + 
  geom_line(aes(color=type), size=1) + 
  geom_hline(yintercept=0.33) +
  ylim(0, max(df$value))
dev.off()

