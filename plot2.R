
# Check to see if the required packages for the script are installed and loaded

        if (!require("tidyr"))
                install.packages("tidyr")
        library("tidyr")
        

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
          
        dataset_1$Date <- as.Date(dataset_1$Date, "%d/%m/%Y")
              
        dataset_dates_filtered <- filter(dataset_1, Date >= "2007-02-01",  Date <= "2007-02-02")
        
        dataset_unite_date_time <- unite(dataset_dates_filtered,datetime,Date,Time, sep = " ", remove = TRUE)
        
        dataset_unite_date_time$datetime <- strptime(dataset_unite_date_time$datetime, format = "%Y-%m-%d %H:%M:%S") 
        
# View the plot within R 
        
        plot(dataset_unite_date_time$datetime,dataset_unite_date_time$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
        
# Save the plot to a .png file in the current working directory 
        
        png(filename = "plot2.png", width = 480, height = 480) 
        
        plot(dataset_unite_date_time$datetime,dataset_unite_date_time$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
        
        dev.off()
        
        print("Image saved to current working directory")
