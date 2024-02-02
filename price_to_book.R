library(openxlsx)
# Load the Excel file
file_path <- "C:/Users/kunal.kunde/OneDrive - iifl wealth/WIP/Factor Investing/Python Files/PB, PCE, PE and EV_EBITDA.xlsx"
df <- read.xlsx(file_path, sheet = 'Sheet1')
df <- df[, -1] # Drop the '# column
colnames(df) <- c("Company_Name", paste0(rep(c("FY", "PE", "PCE", "PB", "EV_EBITDA"), each = 13), "_",
                                         rep(2022:2010, times = 5)))

# Extract necessary columns for price-to-book data
company_list <- df[, 1]
start_col <- which(colnames(df) == 'PB_2022')
end_col <- which(colnames(df) == 'PB_2010')
data <- df[, start_col:end_col]

# Convert non-numeric values to NA
data <- apply(data, 2, as.numeric)

# Calculate mean and standard deviation for each column (ignoring NA values and excluding zeros)
means <- colMeans(data, na.rm = TRUE)
stds <- apply(data, 2, sd, na.rm = TRUE)

# Calculate z-scores for each value in each column
z_scores <- scale(data, center = means, scale = stds)

# Create a new data frame with company names and corresponding z-scores
z_scores_with_names <- data.frame(Company_Name = company_list, z_scores)
print(z_scores_with_names) # Print to std output
