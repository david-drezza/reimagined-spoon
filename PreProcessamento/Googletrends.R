

devtools::install_github('PMassicotte/gtrendsR')

library(gtrendsR)
library(tidyverse)
library(plotly)

# Visualizando as categorias
head(categories,20)

# Visualizando as regiões
head(countries,20)

# Visualizando as marcações do Brasil
head(countries[countries$country_code =='BR',],20)

finamax <-gtrends('emprestimo pessoal',time='now 6-H',geo = "BR-SP")
plot(finamax,color=finamax$interest_by_city$location)
# resumo do resultado da busca
finamax %>% summary()

# Interesse por cidade
filtro <- finamax$interest_by_city[,c('location','hits')]
filtro <- filtro[!is.na(filtro$hits),]
plot(filtro)
#tópicos relacionados
finamax$related_topics

# Buscas relacionadas
finamax$related_queries

# observar interesse com o tempo
finamax %>%
  .$interest_over_time %>%
  glimpse()

plot(finamax)

finamax2 <- gtrends('emprestimo pessoal',
                    time='now 7-d',
                    geo = 'BR-SP')
plot(finamax2$interest_by_city[,c('location','hits')])


??gtrendsr


finamax <-gtrends('emprestimo pessoal',time='now 1-d',geo = "BR-SP")
finamax$interest_by_city[,c('location','hits')]
