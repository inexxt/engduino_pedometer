#File must be placed in the same folder as "logger.txt" file

fl <- file("logger.txt", open = 'r')
mf = readLines(fl)
spl_mf <- strsplit(mf, "\t")
allData <- matrix(c(unlist(spl_mf)), ncol = 2, byrow = T)
#allData[,c(2,1)] = allData[,c(1,2)]

licz <- 1
lst <- c()
for (cnt in allData)
{
	if(cnt == "time")
	{
		lst <- c(lst, licz)
	}
	licz <- licz + 1
}
lst <- c(lst, licz/2-0.5)
par(mfrow=c(length(lst)-1,1))
p <- c()
for(cnt in c(1:(length(lst)-1)))
{
	p <- c(cnt, p) 
	plot(allData[(lst[cnt]+1):(lst[cnt+1]-1),], type = "o", col="red", xlab="time", ylab="steps")
}
