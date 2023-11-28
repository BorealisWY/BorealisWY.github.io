library(tidyverse)
badlands <- read.csv(file.choose())

names(badlands) <- c("name","preburn","year_one","year_two")

badlands_long <- badlands %>%
  gather(
    key = "burn_status",
    value = "plant_density",
   preburn:year_two, 
   factor_key = TRUE
)

ggplot(
  data = badlands_long,
  aes(x = burn_status,   y = plant_density)) + 
  stat_boxplot(
    geom = "errorbar")+
  geom_boxplot()+
  theme_classic()


t.test(
  x = badlands$preburn,
  y = badlands$year_two,
  paired = T
)


badlands$diff_yr1 = badlands$year_one - badlands$preburn

badlands$diff_yr2 = badlands$year_two - badlands$preburn

t.test(badlands$diff_yr1)
t.test(badlands$diff_yr2)
