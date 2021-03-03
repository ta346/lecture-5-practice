#Introduction to ggplot

install.packages("ggplot2")
install.packages("tidyverse")
install.packages("skimr")


library(ggplot2)
library(tidyverse)
library(readr)
library(skimr)

#load the data 
coronavirus <- read_csv('https://raw.githubusercontent.com/RamiKrispin/coronavirus/master/csv/coronavirus.csv')

coronavirus
dim(coronavirus)
names(coronavirus)
summary(coronavirus)
countis.na(coronavirus$cases)
?count
skim(coronavirus)      
names(coronavirus)
not_zero <- subset(coronavirus, cases = 0)
filter(coronavirus, cases != 0)
us_coronavirus <- filter(coronavirus, country == "US")
a <- subset(coronavirus, )
?subset

filter(coronavirus, country %in% c("Denmark", "Italy", "Spain"), type == "death", date == "2021-02-28")

select(coronavirus, date, country, type, cases)
select(coronavirus, -lat, -long, -province)

select(coronavirus, country, lat, long)

coronavirus_us <- filter(coronavirus, country == "US")
coronavirus_us2 <- select(coronavirus_us, -lat, -long, -province) 


coronavirus %>% 
  filter(country == "US") %>% 
  select(-lat, -long, -province)

coronavirus %>%
  filter(country %in% c("US", "Canada", "Mexico"), type == "death") %>%
  select(country, date, cases) %>%
  ggplot() +
  geom_line(mapping = aes(x = date, y = cases, color = country))

# lesson 8 ----------------------------------------------------------------

skim(coronavirus)
coronavirus_ttd %>%
  mutate(deathrate = round(death/confirmed, 2))

coronavirus %>%
  filter(type == "confirmed") %>%
  summarize(sum = sum(cases))

coronavirus %>%
  filter(type == "confirmed") %>%
  group_by(date)%>%
  summarize(sum_cases = sum(cases),
            mean_cases = mean(cases),
                              n = n())

