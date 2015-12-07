args <- commandArgs(TRUE)
setwd(args[1])

peak<-read.csv(file = args[2], header=T, sep=" ")
png(args[3], width = 1200, height = 1000)

c <- plot(peak$t, peak$r, type="n", xlim=c(min(peak$t)-0.1,max(peak$t)+0.1), ylim=c(0,max(peak$r)+10))
for (i in 1:nrow(peak)){
points(peak[i,3],peak[i,4])
text(peak[i,3],peak[i,4],peak[i,2], col=as.character(peak$col[i]))
}
dev.off()

png(args[4], width = 1200, height = 1000)
hist(peak$peak_id, breaks = max(peak$peak_id))
dev.off()