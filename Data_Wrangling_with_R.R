install.packages("tidyverse")

install.packages("dplyr")

library(tidyverse)

library(dplyr)

#Importing the CSV
telcos_df <- read_csv("E:\\WA_Fn-UseC_-Telco-Customer-Churn.csv")

telcos_df

# Reading the first records of the data
head(telcos_df)

head(telcos_df, 10)

# Reading the last records of the data
tail(telcos_df)


glimpse(telcos_df)

#Checking the data columns
str(telcos_df)

#Data sample records
sample_n(telcos_df, 5)

#Data's shape
dim(telcos_df)

#Checking duplicates
telcos_df[duplicated(telcos_df), ]

#*********Descriptive Questions to Answer********#

# Total number of customers
nrow(telcos_df)

# Number of Customers by Gender
telcos_df %>%
  group_by(gender) %>%
  summarize(no_of_customers = n())

# Proportion of SeniorCitizens
telcos_df %>%
  group_by(SeniorCitizen) %>%
  summarize(no_of_customers = n())

# Customer Nos by Have Dependents
telcos_df %>%
  group_by(Dependents) %>%
  summarize(no_of_customers = n())

# Customer Nos by Partner
telcos_df %>%
  group_by(Partner) %>%
  summarize(no_of_customers = n())

# Counting distinct values product usage response
telcos_df %>%                              
  summarise(PhoneService = n_distinct(PhoneService),MultipleLines = n_distinct(MultipleLines),OnlineSecurity = n_distinct(OnlineSecurity),OnlineBackup = n_distinct(OnlineBackup),
            DeviceProtection = n_distinct(DeviceProtection),TechSupport = n_distinct(TechSupport),StreamingTV = n_distinct(StreamingTV),StreamingMovies = n_distinct(StreamingMovies),
            Contract = n_distinct(Contract),PaperlessBilling = n_distinct(PaperlessBilling),PaymentMethod = n_distinct(PaymentMethod)
            )
            
# Total Revenue by Churn Status
telcos_df %>%
  group_by(Churn) %>%
  summarize(MonthlyCharges = sum(MonthlyCharges),Total_Charges = sum(TotalCharges))

# Payment Method with highest Churn customers
churn_customers = filter(telcos_df, Churn == "Yes")

churn_customers %>%
  group_by(PaymentMethod) %>%
  summarize(no_of_customers = n()) %>%
  arrange(desc(no_of_customers))


