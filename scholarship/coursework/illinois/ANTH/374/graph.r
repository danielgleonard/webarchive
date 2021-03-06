options(echo=TRUE) # if you want see commands in output file
args <- commandArgs(trailingOnly = TRUE)
print(args)

#file <- args[1]
file <- "log.csv"

require(readr)
log <- read_csv(file, col_types = cols(Coronavirus = col_integer(),
                Date = col_datetime(format = "%Y-%m-%dT%H:%M:%S%Z"),
                Total = col_integer()), locale = locale(tz = "US/Central"),
                na = "NA")
knitr::kable(log)
#plot(log$Coronavirus, type = "o",col = "red", xlab = "Date", ylab = "Servers", 
#     main = "Minecraft servers online")
#lines(log$Total, type = "o", col = "blue")

require(ggplot2)
require(dplyr)
require(patchwork)
require(hrbrthemes)
require(tikzDevice)

tikz('plot.tex')

coeff <- 1000

# A few constants
temperatureColor <- "#69b3a2"
priceColor <- rgb(0.2, 0.6, 0.9, 1)

ggplot(log, aes(x=Date)) +
  
  geom_line( aes(y=Total / coeff), size=2, color=temperatureColor) + 
  geom_line( aes(y=Coronavirus), size=2, color=priceColor) +
  
  scale_y_continuous(
    
    # Features of the first axis
    name = "Total servers (\\(\\times 1,000\\))",
    
    # Add a second axis and specify its features
    sec.axis = sec_axis(~.*1, name="Referencing ``coronavirus''")
  ) + 
  
  theme_ipsum() +
  
  theme(
    axis.title.y = element_text(color = temperatureColor, size=13),
    axis.title.y.right = element_text(color = priceColor, size=13)
  ) +
  
  ggtitle("\\emph{Minecraft} servers online")

dev.off()
