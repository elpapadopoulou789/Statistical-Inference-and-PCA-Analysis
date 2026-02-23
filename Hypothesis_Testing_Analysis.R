#a)
# Numeric vector of student's grades, directly from slides
methA <- c(78, 82, 85, 79, 81, 84, 80, 83)
methB <- c(80, 83, 86, 83, 84, 86, 85, 86, 85)

# Welch two-sample t-test (var.equal = FALSE is default)
t_two_test <- t.test(methA, methB,var.equal = FALSE)
t_two_test
#Print the p-value and round to three decimal places
cat("The p-value is:", round(t_two_test$p.value,3))

#b)
# Numeric vector of number of push-ups before and after
before <- c(22,	18,	25,	20,	24,	19,	21,	23,	17,	26)
after <- c(22, 19,	26,	21,	24,	20,	22,	21,	18,	27)

# One-sided paired t-test
t_paired <- t.test(after, before, paired = TRUE, alternative = "greater")
t_paired

#Print the p-value and round to three decimal places
cat("The p-value is:", round(t_paired$p.value,3))

#c)
# Create 3x2 matrix with counts from the slides:
social_media_data <- matrix(
  c(85, 55,   # Instagram
    70, 45,   # Tik tok
    50, 70),  # Facebook
  nrow = 3, byrow = TRUE)

# Set row/column names for clarity
rownames(social_media_data) <- c("Instagram", "TikTok", "Facebook")
colnames(social_media_data) <- c("18-24", "25-40")

social_media_data

# Chi-square test for Social_media_data
chisq_social_media_data <- chisq.test(social_media_data)
chisq_social_media_data

#Print the p-value and round to four decimal places
cat("The p-value is:", round(chisq_social_media_data$p.value,4))

# Stacked barplot for social_media_data
barplot(t(social_media_data),
        beside      = FALSE,                 
        col         = c("lightblue","orange"),  
        main        = "Social Media preference by age group",
        ylab        = "Count",
        xlab        = "Social Media Platform",
        legend.text = colnames(social_media_data),      
        args.legend = list(x = "topright"))

#d)
install.packages("outliers")
library(outliers)

# Numeric vector of pollutant concentration in water samples
water_samples <- c(12.3, 13.1, 12.8, 14.2, 12.5, 13.4, 12.9, 22.6, 13.2, 12.7, 24.8, 13.0, 12.6)

#First Grubb's Test
test_1 <- grubbs.test(water_samples)
test_1

#Print the p-value and round to four decimal places
cat("The p-value is:", round(test_1$p.value,4))

# Numeric vector of pollutant concentration in water samples (without the most extreme value)
water_samples_1 <- c(12.3, 13.1, 12.8, 14.2, 12.5, 13.4, 12.9, 22.6, 13.2, 12.7, 13.0, 12.6)

#Second Grubb's Test
test_2 <- grubbs.test(water_samples_1)
test_2

#Print the p-value and round to four decimal places
cat("The p-value is:", round(test_2$p.value,4))

#Boxplot for pollutant concentration in water samples
boxplot(water_samples,
        main = "Pollutant concentration in water samples",
        ylab = "Concetration",
        col = "green")
