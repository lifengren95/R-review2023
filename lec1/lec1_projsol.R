#____________________________
#  Script Information----
#____________________________
##
## Script Title: Comprehensive Challenge Project: Lec 1
##
## Task: Solution
##
## Author: Lifeng Ren
##
## Date Last Modified: 2023-08-14
##
## Date Created: 2023-08-13
##
## Copyright (c) Lifeng Ren, 2023
## Email: ren00154@umn.edu
##
## ___________________________
##
## Version: V1.0 (2023-08-14)
##   
## Version Notes: Initial Efforts
## ___________________________



#__________________________________________
##  Load necessary libraries----   
#__________________________________________


library(datasets)

  
#__________________________________________
##  Load mtcars dataset----   
#__________________________________________ 

data(mtcars)

#__________________________________________
##  Question 1----   
#__________________________________________ 


# (a) Vectors:

# Create a numeric vector for mpg
mpg_vector <- mtcars$mpg

# Calculate and print the average mpg
average_mpg <- mean(mpg_vector)
print(paste("Average mpg:", average_mpg))

# Access and print the mpg of the 10th car
print(paste("mpg of the 10th car:", mpg_vector[10]))

# (b) Matrices:

# Convert first 5 rows and 3 columns of mtcars into a matrix
sub_matrix <- as.matrix(mtcars[1:5, 1:3])

# Multiply the matrix by 2 and print
multiplied_matrix <- sub_matrix * 2
print("Matrix after multiplication by 2:")
print(multiplied_matrix)

# (c) Lists:

# Create a list
car_list <- list(hp = mtcars$hp, car_names = rownames(mtcars))

# Access and print the name of the 5th car
print(paste("Name of the 5th car:", car_list$car_names[5]))

#__________________________________________
##  Question 2----   
#__________________________________________ 


# Access and print details of the car with the highest horsepower
max_hp_car <- mtcars[which.max(mtcars$hp), ]
print("Car with the highest horsepower:")
print(max_hp_car)

# Save this single-row data frame to CSV
write.csv(max_hp_car, "high_hp_car.csv", row.names = TRUE)

# Read the CSV back and print
read_data <- read.csv("high_hp_car.csv", row.names = 1)
print("Data from high_hp_car.csv:")
print(read_data)

#__________________________________________
##  Question 3----   
#__________________________________________ 


# Filter cars
filtered_cars <- mtcars[mtcars$mpg > 20 & mtcars$cyl < 6, ]

# Calculate and print the required metrics
avg_hp <- mean(filtered_cars$hp)
median_wt <- median(filtered_cars$wt)
manual_transmission_count <- sum(filtered_cars$am == 1)

print(paste("Average horsepower of filtered cars:", avg_hp))
print(paste("Median weight of filtered cars:", median_wt))
print(paste("Number of cars with manual transmission:", manual_transmission_count))

#__________________________________________
##  Question 4----   
#__________________________________________ 


# Create matrix
challenge_matrix <- as.matrix(mtcars[1:3, c("mpg", "hp", "wt")])

# Check if matrix is singular
if (det(challenge_matrix) == 0) {
  print("Matrix is singular, cannot invert.")
} else {
  inverted_matrix <- solve(challenge_matrix)
  print("Inverted Matrix:")
  print(inverted_matrix)
}
