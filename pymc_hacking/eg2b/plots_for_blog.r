
setwd("~/dev/doing_bayesian_data_analysis/pymc_hacking/eg2b/")

d = read.delim("data", h=F, col.names=c("value"))
png("data.eg2.png", width = 600, height = 300)
ggplot(d, aes(value)) + geom_histogram()
dev.off()

read_trace <- function(name) {
  filename = paste(name, ".trace", sep="")
  df = read.delim(filename, h=F, col.names=c("value"))
  df$type = name
  df$sample = 1:nrow(df)
  return(df)
}


mean = read_trace("mean")
sd = read_trace("std_dev")
df = rbind(mean, sd)

png("traces.eg2.png", width = 600, height = 300)
ggplot(df, aes(sample, value)) + geom_line(aes(color=type), size=2) + ylim(0, max(df$value))
dev.off()

