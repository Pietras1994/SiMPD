#install.packages("C50")
library("C50")
data <- matrix(c(1296000, 4096000, 4096000, 4096000, 1296000, 3317760, 4096000, 3317760, 3317760, 3317760, 5184000, 4096000,
                 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 16, 16,
                 128, 128, 128, 256, 256, 256, 256, 256, 256, 512, 512, 256,
                 3779, 5599, 5699, 6899, 5199, 5899, 6799, 6499, 5999, 7199, 12899, 9399), 12, 4)
labels <- c("1", "2", "3", "4", "5")
result <- c(2, 3, 4, 4, 3, 4, 4, 3, 3, 4, 3, 3)
test <- factor(result, labels)
colnames(data) <- c("Ekran", "Ram", "Dysk", "Cena")

ruleModel <- C5.0(x = data[,], y = test, rules = TRUE)
ruleModel
summary(ruleModel)