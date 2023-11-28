library(tidyverse)
chicky <- read.csv(file.choose())

chicky_long <- chicky %>%
  gather(
    key = "group",
    value = "weight",
    Control:High.dose,
    factor_key = TRUE
  )
    
    
t.test(
  x = chicky$Control,
  y = chicky$Low.dose,
  paired = FALSE
)

mean(chicky$Control) # Mean of Y

mean(chicky$Low.dose) 

t.test(
  x = chicky$Low.dose,
  y = chicky$Control,
  conf.level = .80
)