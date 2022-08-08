#Librerias 
library(tidyverse)
library(lubridate)

#Uniendo los conjuntos de datos mensuales

viajes_cyclistic <- full_join(julio_2021,agosto_2021)
viajes_cyclistic <- full_join(viajes_cyclistic,septiembre_2021)
viajes_cyclistic <- full_join(viajes_cyclistic,octubre_2021)
viajes_cyclistic <- full_join(viajes_cyclistic,noviembre_2021)
viajes_cyclistic <- full_join(viajes_cyclistic,diciembre_2021)
viajes_cyclistic <- full_join(viajes_cyclistic,enero_2022)
viajes_cyclistic <- full_join(viajes_cyclistic,febrero_2022)
viajes_cyclistic <- full_join(viajes_cyclistic,marzo_2022)
viajes_cyclistic <- full_join(viajes_cyclistic,abril_2022)
viajes_cyclistic <- full_join(viajes_cyclistic,mayo_2022)
viajes_cyclistic <- full_join(viajes_cyclistic,junio_2022)

#Añadiendo una columna mes para visualizar mas facilmente en que mes ha sido cada viaje

viajes_cyclistic <- viajes_cyclistic %>% 
  mutate(month = month(started_at,label = TRUE,abbr = FALSE) )

#Sacando promedios agrupando por diferentes criterios

promedio_viajes_dias <- viajes_cyclistic %>% 
  filter(ride_length<90000 & (ride_length>30 & start_station_id != end_station_id)) %>%
  group_by(day_of_week) %>% 
  summarise(Promedio = hms::as_hms(mean(ride_length))) 

promedio_viajes_miembros <- viajes_cyclistic %>% 
  filter(ride_length<90000 & (ride_length>30 & start_station_id != end_station_id)) %>%
  group_by(member_casual) %>% 
  summarise(Promedio = hms::as_hms(mean(ride_length)))

promedio_viajes_miembros_vs_dias <- viajes_cyclistic %>% 
  filter(ride_length<90000 & (ride_length>30 & start_station_id != end_station_id)) %>%
  group_by(day_of_week, member_casual) %>% 
  summarise(Promedio = hms::as_hms(mean(ride_length)))

promedio_viajes_meses <- viajes_cyclistic %>% 
  filter(ride_length<90000 & (ride_length>30 & start_station_id != end_station_id)) %>%
  group_by(month) %>% 
  summarise(Promedio = hms::as_hms(mean(ride_length)))

promedio_viajes_meses_vs_miembros <- viajes_cyclistic %>% 
  filter(ride_length<90000 & (ride_length>30 & start_station_id != end_station_id)) %>%
  group_by(month,member_casual) %>% 
  summarise(Promedio = hms::as_hms(mean(ride_length)))

#Calculando cantidad total de viajes y agrupando por diferentes criterios

cantidad_viajes_miembro <- viajes_cyclistic %>% 
  filter(ride_length<90000 & (ride_length>30 & start_station_id != end_station_id)) %>% 
  group_by(member_casual) %>% 
  count() 

cantidad_viajes_dia <- viajes_cyclistic %>% 
  filter(ride_length<90000 & (ride_length>30 & start_station_id != end_station_id)) %>% 
  group_by(day_of_week) %>% 
  count()

cantidad_viajes_miembro_vs_dias <- viajes_cyclistic %>% 
  filter(ride_length<90000 & (ride_length>30 & start_station_id != end_station_id)) %>%
  group_by(day_of_week,member_casual) %>% 
  count() 

cantidad_viajes_mes <- viajes_cyclistic %>% 
  filter(ride_length<90000 & (ride_length>30 & start_station_id != end_station_id)) %>%
  group_by(month) %>% 
  count() 

cantidad_viajes_miembro_vs_mes <- viajes_cyclistic %>% 
  filter(ride_length<90000 & (ride_length>30 & start_station_id != end_station_id)) %>% 
  group_by(month,member_casual) %>% 
  count()

cantidad_viajes_tipo <- viajes_cyclistic %>% 
  filter(ride_length<90000 & (ride_length>30 & start_station_id != end_station_id)) %>%
  group_by(rideable_type) %>% 
  count() 

cantidad_viajes_tipo_vs_dia <- viajes_cyclistic %>% 
  filter(ride_length<90000 & (ride_length>30 & start_station_id != end_station_id)) %>%
  group_by(day_of_week,rideable_type) %>% 
  count()

cantidad_viajes_tipo_vs_member <- viajes_cyclistic %>% 
  filter(ride_length<90000 & (ride_length>30 & start_station_id != end_station_id)) %>%
  group_by(member_casual,rideable_type) %>% 
  count()

#Creando archivos .csv con los datos extraidos para su visualizacion

write_csv(promedio_viajes_dias,file = "Promedio duracion de viajes por dia.csv")
write_csv(promedio_viajes_miembros,file = "Promedio duracion de viajes por miembros.csv")
write_csv(promedio_viajes_meses ,file = "Promedio duracion de viajes por meses.csv")
write_csv(promedio_viajes_miembros_vs_dias ,file = "Promedio duracion de viajes por dia contra miembros.csv")
write_csv(promedio_viajes_meses_vs_miembros,file = "Promedio duracion de viajes por mes contra miembros.csv")

write_csv(cantidad_viajes_miembro_vs_dias,file = "Cantidad de viajes por dia y tipo de miembro.csv")
write_csv(cantidad_viajes_dia,file = "Cantidad de viajes por dia.csv")
write_csv(cantidad_viajes_miembro ,file = "Cantidad de viajes por tipo de miembro.csv")
write_csv(cantidad_viajes_mes ,file = "Cantidad de viajes por mes.csv")
write_csv(cantidad_viajes_miembro_vs_mes ,file = "Cantidad de viajes por mes contra tipo de miembro.csv")
