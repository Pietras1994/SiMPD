#library("MCDA")

epsilon <- 0.01

t <- read.table("C:/Users/Piotr Waleczek/Desktop/SiMPD/3.csv", header = TRUE, sep = ";", row.names = 1)

alternativesRanks <- c(1,2,3,4,5,6,7,8,9,10,11,12,13)
names(alternativesRanks) <- row.names(t)

criteriaMinMax <- c("max","max","max","max","min")
names(criteriaMinMax) <- colnames(t)
x <- additiveValueFunctionElicitation(t,
                                      criteriaMinMax, epsilon,
                                      alternativesRanks = alternativesRanks)

print(x)