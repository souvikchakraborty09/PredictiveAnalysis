# Load necessary libraries
install.packages("rpart")  # Install 'rpart' package if not already installed
install.packages("rpart.plot")  # Install 'rpart.plot' package if not already installed
library(rpart)
library(rpart.plot)

# Load the dataset
file_path <- file.choose()  # Alternatively, manually set the file path

wine_data <- read.csv(file_path, sep = ",", stringsAsFactors = TRUE)


# Split the data into training and testing sets (70:30 ratio)
set.seed(123)
sample_index <- sample(seq_len(nrow(wine_data)), size = 0.7 * nrow(wine_data))
train_data <- wine_data[sample_index, ]
test_data <- wine_data[-sample_index, ]

# Fit the decision tree model
model <- rpart(quality ~ ., data = train_data, method = "class")

# Make predictions on the test data
predictions <- predict(model, test_data, type = "class")

# Create confusion matrix
conf_matrix <- table(predictions, test_data$quality)
print("Confusion Matrix:")
print(conf_matrix)

# Visualize the decision tree
rpart.plot(model)

# Calculate accuracy
accuracy <- sum(diag(conf_matrix)) / sum(conf_matrix)
cat("Accuracy:", accuracy, "\n")
