
# Check to see if the required packages for the script are installed and loaded

        if (!require("plyr")) {
                install.packages("plyr")
        }
        library("plyr")
        
        
        if (!require("dplyr")){
                install.packages("dplyr")
        }
        library("dplyr")
        
        if (!require("readr")) {
                install.packages("readr")
        }
        library("readr")
        
# Read the Dataset into R (make sure the data is in the current working directory)
        
        dataset_1 <- read_delim("household_power_consumption.txt", delim = ";")
        
# Convert the column "Date" into a proper date format (not a character vector)
        
        dataset_1$Date <- as.Date(dataset_1$Date, "%d/%m/%Y")
        
# Fliter only the date ranges we need for the assignment
        
        dataset_dates_filtered <- filter(dataset_1, Date >= "2007-02-01",  Date <= "2007-02-02")
        
# Create plot based on example in the problem set
        
        plot1 <- hist(dataset_dates_filtered$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
        
# View the file within R and save .png file to working directory  
        
        png(filename = "plot1.png", width = 480, height = 480)
        plot(plot1,col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
        dev.off()
