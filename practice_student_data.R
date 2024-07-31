# IT Summit 2024
# Measuring Success

library(tidyverse)
library(readr)
library(ggplot2)

# Sample data frame
practice_student_data <- data.frame(
  Name = c("Alice Johnson", "Bob Smith", "Charlie Brown", "Dana White", "Eva Green", "Frank Miller",
           "Grace Lee", "Henry Adams", "Ivy Zhang", "Jack Davis", "Kelly Brown", "Liam Johnson",
           "Mia Wilson", "Noah Martinez", "Olivia Thomas", "Paul Walker", "Quinn Harris",
           "Ryan Young", "Sarah King", "Tim Roberts", "Gayle Fisher", "Xin Lu"),
  Major = c("Computer Science", "Biology", "Business", "Engineering", "Psychology", "History",
            "Mathematics", "Art", "Chemistry", "Physics", "Economics", "Political Science",
            "Sociology", "Environmental Sci", "Philosophy", "Nursing", "Education", "Computer Eng.",
            "Criminal Justice", "Music", "Cybersecurity", "Astronomy"),
  Class_Standing = c("Freshman", "Sophomore", "Junior", "Senior", "Freshman", "Sophomore",
                     "Junior", "Senior", "Freshman", "Sophomore", "Junior", "Senior",
                     "Freshman", "Sophomore", "Junior", "Senior", "Freshman", "Sophomore",
                     "Junior", "Senior", "Freshman", "Senior"),
  Campus = c("Main Campus", "Online", "Main Campus", "Sierra Vista", "Phoenix",
             "Main Campus", "Online", "Main Campus", "Phoenix", "Main Campus", "Main Campus",
             "Online", "Main Campus", "Phoenix", "Main Campus", "Online", "Online",
             "Main Campus", "Phoenix", "Main Campus", "Online", "Sierra Vista"),
  Pell_Grant = c("Yes", "No", "Yes", "No", "Yes", "Yes", "No", "Yes", "No", "Yes", "No",
                 "No", "Yes", "No", "Yes", "No", "No", "Yes", "No", "Yes", "No", "No"),
  First_Gen = c("Yes", "No", "Yes", "No", "Yes", "No", "Yes", "No", "Yes", "No", "No",
                "Yes", "No", "Yes", "No", "Yes", "No", "Yes", "No", "Yes", "No", "No")
)

# practice_student_data <- read_csv("~/Documents/Trellis/IT_Summit_2024/practice_student_data.csv")

# practice_student_data$Campus <- recode(practice_student_data$Campus,
#                                                    "Main Campus" = "Main",
#                                                    "Downtown Campus" = "Online",
#                                                    "South Campus" = "Phoenix",
#                                                    "North Campus" = "Sierra Vista")

# Add a column with random values between 2 and 4
set.seed(123) # For reproducibility
practice_student_data <- practice_student_data %>%
  mutate(GPA = runif(n(), min = 2, max = 4))

# Create the histogram
ggplot(practice_student_data, aes(x = GPA)) +
  geom_histogram(binwidth = 0.1, position = "dodge") +
  labs(title = "Histogram of Students by GPA", x = "GPA", y = "Count") +
  theme_minimal()

# Create the histogram
ggplot(practice_student_data, aes(x = GPA, fill = First_Gen)) +
  geom_histogram(binwidth = 0.05, position = "dodge") +
  labs(title = "Histogram of Students by GPA with First Gen", x = "GPA", y = "Count") +
  scale_fill_manual(values = c("Yes" = "blue", "No" = "red")) +
  theme_minimal()

# Create the boxplot
ggplot(practice_student_data, aes(x = First_Gen, y = GPA, fill = First_Gen)) +
  geom_boxplot() +
  labs(title = "Boxplot of GPA by First Generation Status", x = "First Generation Status", y = "GPA") +
  scale_fill_manual(values = c("Yes" = "blue", "No" = "red")) +
  theme_minimal()

# Create the violin plot
ggplot(practice_student_data, aes(x = First_Gen, y = GPA, fill = First_Gen)) +
  geom_violin(trim = FALSE) +
  labs(title = "Violin Plot of GPA by First Generation Status", x = "First Generation Status", y = "GPA") +
  scale_fill_manual(values = c("Yes" = "blue", "No" = "red")) +
  theme_minimal()

# Create the violin plot
ggplot(practice_student_data, aes(x = Pell_Grant, y = GPA, fill = Pell_Grant)) +
  geom_violin(trim = TRUE) +
  labs(title = "Violin Plot of GPA by Pell Grant Recipient", x = "Received Pell Grant", y = "GPA") +
  scale_fill_manual(values = c("Yes" = "Orange", "No" = "Purple")) +
  theme_minimal()


# Create the violin plot
ggplot(practice_student_data, aes(x = Campus, y = GPA, fill = Campus)) +
  geom_violin(trim = TRUE) +
  labs(title = "Violin Plot of GPA by Campus", x = "Campus", y = "GPA") +
  theme_minimal()

# Create the scatterplot
ggplot(practice_student_data, aes(x = Major, y = GPA)) +
  geom_point(aes(color = Major), size = 3) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Scatterplot of GPA by Major",
       x = "Major",
       y = "GPA",
       color = "Major")

# Create the scatterplot ordered
practice_student_data$Major <- factor(practice_student_data$Major, levels = practice_student_data$Major[order(practice_student_data$GPA, decreasing = TRUE)])

ggplot(practice_student_data, aes(x = Major, y = GPA)) +
  geom_point(aes(color = Major), size = 3) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Scatterplot of GPA by Major",
       x = "Major",
       y = "GPA",
       color = "Major")
