data$Date <- as.Date(data$Date, format="%m/%d/%Y")
data$Month <- format(data$Date, "%m")
data$DayOfWeek <- weekdays(data$Date)
data$DayOfWeek <- factor(data$DayOfWeek, levels=c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"))
weekday_sales <- data %>%
group_by(DayOfWeek) %>%
summarise(Total_Sales = sum(Total))
ggplot(weekday_sales, aes(x = DayOfWeek, y = Total_Sales, fill = DayOfWeek)) +
geom_bar(stat = "identity") +
labs(title = "Total Sales by Day of the Week", x = "Day of the Week", y = "Total Sales") +
theme_minimal()
