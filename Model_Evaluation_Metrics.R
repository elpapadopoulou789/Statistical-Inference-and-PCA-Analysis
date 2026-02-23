#b)
#Installing and loading caret library
install.packages("caret")
library(caret)

#Defining the vectors a and b
a <- c(0,1,1,0,1,0,0,1,0,1)
b <- c(0,0,1,0,1,0,1,1,0,1)

#Converting the vectors into factors
a_factor <- factor(a, levels = c("0","1"))
b_factor <- factor(b, levels = c("0","1"))

#Creating the confusion matrix
confusion_Matrix <- confusionMatrix(data = b_factor, reference = a_factor, positive = "0")

#Printing the results
print(confusion_Matrix)

#c)
#Defining the vector TPR and FPR
tpr <- c(0.0, 0.1, 0.3, 0.5, 0.7, 0.85, 0.9, 1.0)
fpr <- c(0.0, 0.0, 0.1, 0.2, 0.4, 0.6, 0.8, 1.0)

#Ploting the ROC curve
plot(fpr, tpr, type = "b", col = "blue", lwd = 2,
     main = "ROC curve",
     xlab = "FPR (1-Specifisity)",
     ylab = "TPR (Sensitivity)")
abline(a = 0, b = 1, lty = 2, col = "gray")

#Calculating the AUC using the sum of the trapezoids
n <- length(tpr)
h <- fpr[2:n] - fpr[1:(n-1)]
b1 <- tpr[1:(n-1)]
b2 <- tpr[2:n]
auc_value <- sum( h * (b1 + b2) / 2 )
cat("\nAUC:", as.numeric(auc_value), "\n")




