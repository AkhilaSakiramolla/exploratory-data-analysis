install.packages("pastecs")
library("gapminder")
library(ggplot2)

df = subset(gapminder)
head(df)
View(df)
min(df$year)
max(df$year)

unique(df[c("continent")])

summary(df)

library(pastecs)
stat.desc(df)


by(df, df$continent, summary)

df_cont = df %>% group_by(year, continent) %>% summarise(lifeExp = weighted.mean(lifeExp), gdpPercap = 
                                                     weighted.mean(gdpPercap))


head(df_cont)
View(df_cont)
  
ggplot(df_cont, aes(year, lifeExp,colour=continent)) + 
  geom_line() + 
  geom_point()

ggplot(df_cont, aes(year, gdpPercap,colour=continent)) + 
  geom_line() + 
  geom_point()

ggplot(df_cont, aes(lifeExp,gdpPercap, group = year, colour = year)) + 
  geom_line() + 
  geom_point() +
  facet_wrap(~ continent,scales = "free")






unique(df_cont[c("year")])


ggplot(df, aes(year, lifeExp)) + geom_line() + facet_wrap(~ continent)

ggplot(data = df, aes(x = year, y = gdpPercap)) + geom_point(aes(color = continent))  + ylab("Life Expectancy") + xlab("Year") + facet_wrap(.~continent,scales = "free")

