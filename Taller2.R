library(naniar)
library(tidyverse)

#1. Cargar y explorar base de datos.
Internet <- read_csv("all_csv sorted.csv")
##Las primeras 10 filas son de: Israel, Kyrgyzstan, Fiji, Italy, Sudan, Russia, Maldova, Bangladesh, Sri Lanka y Chile.



#2. Datos faltantes.
Internet_vacio <- data.frame(miss_var_summary(Internet))



##3. Manipulación de datos
Internet %>%
  mutate("variacion" = as.numeric(`Average price of 1GB (USD  at the start of 2021)`)-
                                     as.numeric(`Average price of 1GB (USD – at start of 2020)`)/
           as.numeric(`Average price of 1GB (USD – at start of 2020)`)*100) %>%
  arrange(desc(variacion))
##Países con mayor incremento en el precio de internet: Saint Helena, Falkland Islands, Nauru, Bermuda,
##Sao Tomé and Principe, Malawi, Benin, Chad, Cayman Islands, Tokelau.




##4. Manipulación de datos
Internet  %>%
  group_by(`Continental region`) %>%
  summarise(velocidad_por_region=mean(`Avg \n(Mbit/s)Ookla`, na.rm = TRUE)) %>%
  arrange(velocidad_por_region)

## África Subsahariana es la región con menor velocidad en promedio de internet.



##5. Gráfico
Internet2 <- Internet %>%
  mutate("porcentaje" = `Internet users` / Population * 100)


ggplot(Internet2, aes(x = `Avg \n(Mbit/s)Ookla`,
                  y = porcentaje)) +
  geom_point()

##Si existe correlación porquese ve como con el aumento de una se incrementa también la otra,
##mostrando una correlación creciente entreambas.
