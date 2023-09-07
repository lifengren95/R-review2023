# Comprehensive Project Solutions: R Programming

# Load necessary libraries
library(dplyr)
library(data.table)

# =========================
# 1. Data Exploration and Cleaning
# =========================

# a) Load the mtcars dataset and display the first few rows
data(mtcars)
head(mtcars)

# b) Check for any missing values in the dataset
if (sum(is.na(mtcars)) == 0) {
  print("No missing values found.")
} else {
  # Handle missing values (e.g., by removing or imputation) if any
  # This is just a placeholder since mtcars doesn't have missing values
  mtcars <- na.omit(mtcars)
}

# =========================
# 2. Custom Function Creation
# =========================

# a) describe_data function
describe_data <- function(column) {
  return(list(
    mean = mean(column),
    median = median(column),
    minimum = min(column),
    maximum = max(column)
  ))
}

# b) cyl_distribution function
cyl_distribution <- function(data) {
  table(data$cyl)
}

# Test the functions
print(describe_data(mtcars$mpg))
print(cyl_distribution(mtcars))

# =========================
# 3. Control Structures
# =========================

# a) Loop over each column
for (col_name in names(mtcars)) {
  if (is.numeric(mtcars[[col_name]])) {
    cat("Statistics for column:", col_name, "\n")
    print(describe_data(mtcars[[col_name]]))
  }
}

# b) Categorize cars based on mpg
mtcars$efficiency <- sapply(mtcars$mpg, function(mpg) {
  if (mpg > 20) {
    return("Efficient")
  } else if (mpg >= 15 && mpg <= 20) {
    return("Moderate")
  } else {
    return("Inefficient")
  }
})

# =========================
# 4. Data Manipulation
# =========================

# a) Filter and order using base R
cars_4_cyl <- mtcars[mtcars$cyl == 4, ]
ordered_cars <- cars_4_cyl[order(-cars_4_cyl$mpg), ]
print(ordered_cars)

# b) Group and calculate average using dplyr
average_mpg_by_gear <- mtcars %>%
  group_by(gear) %>%
  summarise(avg_mpg = mean(mpg))
print(average_mpg_by_gear)

# c) Convert to data.table and calculate standard deviation
mtcars_dt <- as.data.table(mtcars)
std_dev_by_efficiency <- mtcars_dt[, .(std_dev_hp = sd(hp)), by = efficiency]
print(std_dev_by_efficiency)

