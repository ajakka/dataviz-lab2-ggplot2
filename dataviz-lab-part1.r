# Install ggplot2
install.packages("ggplot2")

library(ggplot2)

# Import data
data = read.csv("./region6.csv")

# geom_point
ggplot(data=data, mapping=aes(x=CNT, y=PV1SCIE)) +
  geom_point() +
  labs(x=NULL, y="Science Scores") +
  theme_bw()

# geom_boxplot
ggplot(data=data, mapping=aes(x=CNT, y=PV1SCIE)) +
  geom_boxplot() +
  labs(x=NULL, y="Science Scores") +
  theme_bw()

# geom_line
ggplot(data=data, mapping=aes(x=CNTSCHID, y=PV1SCIE)) +
  geom_line() +
  labs(x=NULL, y="Science Scores") +
  theme_bw()

# question 01
ggplot(data=data, mapping=aes(x=CNT, y=PV1SCIE)) +
  geom_boxplot() +
  labs(x=NULL, y="Science Scores") +
  theme_bw()

# question 02
ggplot(data=data, mapping=aes(x=CNT, y=PV1SCIE)) +
  geom_boxplot() +
  labs(x=NULL, y="Science Scores") +
  theme_bw() +
  coord_flip()

# question 03
ggplot(data=data, mapping=aes(x=CNT, y=PV1SCIE), fun.y = mean) +
  geom_boxplot() +
  labs(x=NULL, y="Science Scores") +
  theme_bw() +
  coord_flip()

# question 04
ggplot(data=data, mapping=aes(x=CNT, y=PV1SCIE)) +
  geom_boxplot() +
  labs(x=NULL,y="Science enjoyment scores") +
  theme_bw() +
  coord_flip() +
  stat_summary(fun.y=mean, color="blue", geom="point")

# question 05
ggplot(data=data, mapping=aes(x=CNT, y=PV1SCIE)) +
  geom_boxplot() +
  labs(x=NULL,y="Science enjoyment scores") +
  theme_bw() +
  coord_flip() +
  stat_summary(fun.y=mean, color="blue", geom="point") +
  geom_hline(yintercept=493)

# question 06
ggplot(data, aes(x=reorder(CNT, PV1SCIE), y=PV1SCIE)) +
  geom_boxplot() +
  labs(x=NULL,y="Science enjoyment scores") +
  theme_bw() +
  coord_flip() +
  stat_summary(color="blue", geom="point") +
  geom_hline(yintercept=493)

# question 07
region <- (sapply(data$CNT, function(x) {
  if(x %in% c("Canada", "United States", "Mexico")) "N. America" 
  else if (x %in% c("Colombia", "Brazil", "Uruguay")) "S. America" 
  else if (x %in% c("Japan", "B-S-J-G (China)", "Korea")) "Asia" 
  else if (x %in% c("Germany", "Italy", "France")) "Europe" 
  else if (x %in% c("Australia", "New Zealand")) "Australia" 
  else if (x %in% c("Israel", "Jordan", "Lebanon")) "Middle-East" 
  }))

ggplot(data, aes(x=reorder(CNT, PV1SCIE), y=PV1SCIE, fill=region)) +
  geom_boxplot() +
  labs(x=NULL,y="Science enjoyment scores") +
  theme_bw() +
  coord_flip() +
  stat_summary(color="blue", geom="point") +
  geom_hline(yintercept=493)

