# Integrantes 
## Jorge Higuera 
## Hugo Fonseca 
## Danny Buitrago 
## Andres Rodriguez


##Parte 1
##1.1
cal <- 18
if (cal>=0 & cal<10){
  print("¡Hay mucho por mejorar!")
} else if (cal>=10 & cal<20){
  print("¡Bien! Pero podría ser excelente.")
} else if (cal>=20 & cal<=30){
  print("¡Excelente Servicio! Sigue así.")
}

##1.2
sumas <- function(calidad=10, decoracion=5, servicio=15){
  x <- calidad + decoracion + servicio
  return(x)
}

sumas()


##Parte 2 
library(tidyverse)

##2.1
base1 <- read_csv("price_ratings.csv")
base2 <- read_csv("restaurant_locations.csv")

##Para la base1 se observan 672 filas y 3 columnas 
##que cumplen con tipos de datos caracter y double.
##Para la base2 se ven que hay 168 filas y 3 columnas con los
##mismos tipos de datos que la base1.

##No se cumple con que amabas datas sean una observación por fila
##y una variable columna porque la base1 reune todas las variables en
##una sola. 

##2.2
base1_wider <- base1 %>%
  pivot_wider(names_from=Variable, values_from=Valor)

##2.3
base <- base1_wider%>%
  inner_join(base2, 
             by = c("Id" = "Id_restaurant"))

##2.4
base_2 <- base %>%
  select(c(Restaurant, Price, Service))%>%
  arrange(Price)

##Restaurante más barato: Lamarca.
##Restaurante más caro: San Domenico.

##2.5
base_25 <- base%>%
  group_by(East)%>%
  summarise(promedio=mean(Food))
##La comida más cara es en el Este de Manhattan.


##Punto 3
##3.1
regresion = lm((Price ~ Food + Decor + Service + East), data = base)
summary(regresion)
##Lavariable Service no es significativa en el modelo.
##La variable que parece influir más en el precio de la comida es la de East.


##unto 4
##4.1
ggplot(base, aes(Service, linetype=as.factor(East)))+ geom_density() +
  labs(
    title="Gráfico de servicio punto 2.4",
    x="Servicio", y="Densidad",
    linetype="Este"
  )
##Zona con mejor calificación en servicio: Este.

##4.2
ggplot(base, aes(x = Price, y = Decor, color = factor(East))) +geom_point() +
  scale_color_manual(
    labels = c("Oeste", 
               "Este"),
    values = c("blue", 
               "green")
  )
##Restaurante con menor precio es en la zona Oeste.

