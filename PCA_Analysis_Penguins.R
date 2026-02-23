#a)
# Read CSV file
peng_data_raw <- read.csv(file_path, header = TRUE, sep = ",")

#Original data count
original_count <- nrow(peng_data_raw)
original_count

#Discard the rows with missing data
peng_data <- na.omit(peng_data_raw)
peng_data


#Clean data count
clean_count <- nrow(peng_data)
clean_count

#Discarded data count
discarded_count <- original_count - clean_count
discarded_count

#Print the number of discarded rows
print(paste("Number of discarded rows:", discarded_count))

#Calculate the mean of the attributes per species
species_means <- aggregate(cbind(bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g) ~ species, 
                           data = peng_data,
                           FUN = mean)
#Rounding numbers to three decimal places                       
species_means[,2:5] <- round (species_means[,2:5] , 3)
print("Means per species:")
print(species_means)

#Calculate the standard deviation of the attributes per species
species_sd <- aggregate(cbind(bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g) ~ species, 
                           data = peng_data,
                           FUN = sd)
#Rounding numbers to three decimal places
species_sd[,2:5] <- round (species_sd[,2:5] , 3)
print("Standard deviation per species:")
print(species_sd)

#Data frame that contains only the numeric data of peng_data:
peng_num <- peng_data[,c("bill_length_mm", "bill_depth_mm", "flipper_length_mm", "body_mass_g")]
peng_num

#Calculate the means of the overall dataset:
peng_num_mean <- sapply(peng_num, mean)
print("Means for the overall dataset:")
print(round(peng_num_mean,3))

#Calculate the standard deviation of the overall dataset
peng_num_sd <- sapply(peng_num, sd)
print("Standard deviations for the overall dataset:")
print(round(peng_num_sd,3))


#b)
#Standardize the data (peng_num) using z-score standardization method:
peng_num_scaled <- scale(peng_num)
peng_num_scaled

#PCA technique on the original (peng_num) data frame:
pca_original_data <- prcomp(peng_num, center = TRUE, scale. = FALSE)
pca_original_data

#PCA technique on the standardized (z-scored) data frame:
pca_scaled_data <- prcomp(peng_num_scaled)
pca_scaled_data



#Square the standard deviations of the original data to get the variance of each principal conponent
PC_variance_original <- pca_original_data$sdev^2
PC_variance_original


#The sum of the variances of each principal component
total_variance_original <- sum(PC_variance_original)
total_variance_original

#The PVE is each PC_variance divided by the total_variance
PVE_original <- PC_variance_original/total_variance_original
PVE_original

#Print the results and round numbers to three decimal places
print(round(PVE_original,3))

#Square the standard deviations of the standardized data to get the variance of each principal conponent
PC_variance_standardized <- pca_scaled_data$sdev^2
PC_variance_standardized

#The sum of the variances of each principal component
total_variance_standardized <- sum(PC_variance_standardized)
total_variance_standardized

#The PVE is each PC_variance divided by the total_variance
PVE_standardized <- PC_variance_standardized/total_variance_standardized
PVE_standardized

#Print the results and round numbers to three decimal places
print(round(PVE_standardized,3))

#c)
#Create a scree plot depicting the PVE for each principal component
plot(PVE_standardized, type = "b", pch = 19, col = "blue",
     xlab = "Principal Component",
     ylab = "PVE",
     main = "Srcee plot",
     ylim = c(0,1))

#Calculate the cumulative PVE
cumulative_PVE <- cumsum(PVE_standardized)
print(round(cumulative_PVE,3))

#d)
#Performing PCA without the bill_lenght_mm
pca_no_bill_lenght <- prcomp(peng_num_scaled[,-1])

PC_variance_no_bill_lenght <- pca_no_bill_lenght$sdev^2

total_variance_no_bill_lenght <- sum(PC_variance_no_bill_lenght)

pve_no_bill_lenght <- PC_variance_no_bill_lenght/total_variance_no_bill_lenght

print(round(pve_no_bill_lenght,3))

#Performing PCA without the bill_depth_mm
pca_no_bill_depth <- prcomp(peng_num_scaled[,-2])

PC_variance_no_bill_depth <- pca_no_bill_depth$sdev^2

total_variance_no_bill_depth <- sum(PC_variance_no_bill_depth)

pve_no_bill_depth <- PC_variance_no_bill_depth/total_variance_no_bill_depth

print(round(pve_no_bill_depth,3))

#Performing PCA without the flipper_length_mm
pca_no_flipper_length <- prcomp(peng_num_scaled[,-3])

PC_variance_no_flipper_length <- pca_no_flipper_length$sdev^2

total_variance_no_flipper_length <- sum(PC_variance_no_flipper_length)

pve_no_flipper_length <- PC_variance_no_flipper_length/total_variance_no_flipper_length

print(round(pve_no_flipper_length,3))

#Performing PCA without the body_mass_g
pca_no_body_mass <- prcomp(peng_num_scaled[,-4])

PC_variance_no_body_mass <- pca_no_body_mass$sdev^2

total_variance_no_body_mass <- sum(PC_variance_no_body_mass)

pve_no_body_mass <- PC_variance_no_body_mass/total_variance_no_body_mass

print(round(pve_no_body_mass,3))