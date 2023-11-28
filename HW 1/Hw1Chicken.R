library(tidyverse)
chicky <- read.csv(file.choose())

chicky_long <- chicky %>%
  gather(
    key = "group",
    value = "weight",
    Control:High.dose,
    factor_key = TRUE
  )

ggplot(
  data = chicky_long,
  aes(x = group,   y = weight)) + 
  stat_boxplot(
    geom = "errorbar")+
  geom_boxplot()+
  theme_classic()
    
t.test(
  x = chicky$Control,
  y = chicky$High.dose,
  paired = TRUE
)
t.test(
  x = chicky$Control,
  y = chicky$Low.dose,
  paired = TRUE
)

mean(chicky$Control) # Mean of Y

mean(chicky$Low.dose) 

