# Load the data
tests <- read.table("tests.tsv", sep = "\t", header = TRUE)

# Check unique values in the gender column
print(unique(tests$gender))

# Convert gender from numeric to text
# Assuming 1 = Male, 2 = Female, and any other value is "Unanswered" or"other"
tests$gender <- ifelse(tests$gender == 1, "Male",
                       ifelse(tests$gender == 2, "Female",
                              ifelse(tests$gender == 0, "Unanswered", "Other")))

# Calculate extroversion
tests$extroversion <- round((tests$E1 + tests$E2 + tests$E3) / 15, 2)

# Calculate neuroticism
tests$neuroticism <- round((tests$N1 + tests$N2 + tests$N3) / 15, 2)

# Calculate agreeableness
tests$agreeableness <- round((tests$A1 + tests$A2 + tests$A3) / 15, 2)

# Calculate
tests$conscientiousness <- round((tests$C1 + tests$C2 + tests$C3) / 15, 2)

# Calculate openness
tests$openness <- round((tests$O1 + tests$O2 + tests$O3) / 15, 2)

# Write the results to a new CSV file
write.csv(tests, "analysis.csv", row.names = FALSE)