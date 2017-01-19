# Load R's "USPersonalExpenditure" dataset using the "data()" function
# This will produce a data frame called `USPersonalExpenditure`
expense <- data(USPersonalExpenditure)

# The variable USPersonalExpenditure is now accessible to you. Unfortunately,
# it's not a data frame (it's actually what is called a matrix)
# Test this using the `is.data.frame()` function
is.data.frame(expense)

# Luckily, you can simply pass the USPersonalExpenditure variable as an argument
# to the `data.frame()` function to convert it a data farm. Do this, storing the
# result in a new variable
expense <- data.frame(USPersonalExpenditure)
View(expense)
# What are the column names of your dataframe?
colnames(expense)

# Why are they so strange? Think about whether you could use a number like 1940
# with dollar notation!
# Because a $ before a number looks like a price!! Just a guess idk.
# The X before the number would solve that problem.
# Trying to use it without the X yields an "unexpected token" error.

# What are the row names of your dataframe?
rownames(expense)

# Create a column "category" that is equal to your rownames
expense$category <- rownames(expense)

# How much money was spent on personal care in 1940?
expense["Personal Care", "X1940"]

# How much money was spent on Food and Tobacco in 1960?
expense["Food and Tobacco", "X1960"]

# What was the highest expenditure category in 1960?
# Hint: use the `max()` function to find the largest, then compare that to the column
expense[expense$X1960==max(expense$X1960), "category"]

# Define a function `DetectHighest` that takes in a year as a parameter, and
# returns the highest spending category of that year
DetectHighest <- function(year) {
  year <- paste0("X", year)
  expense[expense[[year]]==max(expense[[year]]), "category"]
}

# Using your function, determine the highest spending category of each year
DetectHighest("1940")
DetectHighest("1945")
DetectHighest("1950")
DetectHighest("1955")
DetectHighest("1960")
