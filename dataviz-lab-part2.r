# Install ggplot2
install.packages("ggplot2")

library(ggplot2)

# Import data
data = read.csv("./region6.csv")

region <- (sapply(data$CNT, function(x) {
  if(x %in% c("Canada", "United States", "Mexico")) "N. America" 
  else if (x %in% c("Colombia", "Brazil", "Uruguay")) "S. America" 
  else if (x %in% c("Japan", "B-S-J-G (China)", "Korea")) "Asia" 
  else if (x %in% c("Germany", "Italy", "France")) "Europe" 
  else if (x %in% c("Australia", "New Zealand")) "Australia" 
  else if (x %in% c("Israel", "Jordan", "Lebanon")) "Middle-East" 
}))

# geom_point
ggplot(data, aes(x=reorder(CNT, PV1SCIE), y=PV1SCIE, color=region)) +
  geom_point() +
  labs(x=NULL,y="Science enjoyment scores") +
  theme_bw() +
  coord_flip() +
  stat_summary(color="blue", geom="point") +
  geom_hline(yintercept=493)

# geom_violin
ggplot(data, aes(x=reorder(CNT, PV1SCIE), y=PV1SCIE, color=region)) +
  geom_violin() +
  labs(x=NULL,y="Science enjoyment scores") +
  theme_bw() +
  coord_flip() +
  stat_summary(color="blue", geom="point") +
  geom_hline(yintercept=493)

