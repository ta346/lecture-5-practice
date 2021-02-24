install.packages("ggplot2")
install.packages("tidyverse")

library(ggplot2)
library(tidyverse)

mpg
cars

view(mpg)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = drv, y =class))
