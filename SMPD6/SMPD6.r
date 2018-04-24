library("neuralnet")

#Going to create a neural network to perform prediction
#Type ?neuralnet for more information on the neuralnet library

#Generate training data
#And store them as a dataframe
traininginput <- as.data.frame(matrix(c(1296000,8,128,
                                        4096000,8,128,
                                        4096000,8,128,
                                        4096000,8,256,
                                        1296000,8,256,
                                        3317760,8,256,
                                        4096000,8,256,
                                        3317760,8,256,
                                        3317760,8,256,
                                        3317760,8,512,
                                        5184000,16,512,
                                        4096000,16,256), nrow=12, ncol=3))
trainingoutput <- c(3779, 5599, 5699, 6899, 5199, 5899, 6799, 6499, 5999, 7199, 12899, 9399)

#Column bind the data into one variable
trainingdata <- cbind(traininginput, trainingoutput)

# Create Vector of Column Max and Min Values
maxs <- apply(trainingdata[,], 2, max)
mins <- apply(trainingdata[,], 2, min)

# Use scale() and convert the resulting matrix to a data frame
scaled.trainingdata <- as.data.frame(scale(trainingdata[,], center=mins, scale=maxs-mins))
trainingdata <- scaled.trainingdata

# Check out results
print(head(trainingdata, 10))

colnames(trainingdata) <- c("Ekran", "Ram", "Dysk", "Cena") 
print(trainingdata)

#Train the neural network
#Going to have C(5, 4, 3) hidden layers
#Threshold is a numeric value specifying the threshold for the partial
#derivatives of the error function as stopping criteria.
net.price <- neuralnet(Cena~Ram+Ekran+Dysk, trainingdata, hidden=c(3, 4, 3), threshold=0.001)
print(net.price)

#Plot the neural network
plot(net.price)

#Test the neural network on some training data
testdata <- as.data.frame(matrix(c(1583, 8135, 6421,
                                   2000, 8460, 1500,
                                   1712, 9445, 1819), nrow=3, ncol=3))
scaled.testdata <- as.data.frame(scale(testdata[,], center=mins[1:3], scale=maxs[1:3]-mins[1:3]))
net.results <- compute(net.price, scaled.testdata) #Run them through the neural network

#Lets see what properties net.price has
ls(net.results)

#Lets see the results
print(net.results$net.result)