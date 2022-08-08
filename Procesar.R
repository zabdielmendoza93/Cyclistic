#Librerias
library(tidyverse)
library(lubridate)

#Leyendo los datos de los conjuntos originales

julio_2021 <- read_csv("Originales/202107-tripdata.csv")
agosto_2021 <- read_csv("Originales/202108-tripdata.csv")
septiembre_2021 <- read_csv("Originales/202109-tripdata.csv")
octubre_2021 <- read_csv("Originales/202110-tripdata.csv")
noviembre_2021 <- read_csv("Originales/202111-tripdata.csv")
diciembre_2021 <- read_csv("Originales/202112-tripdata.csv")
enero_2022 <- read_csv("Originales/202201-tripdata.csv")
febrero_2022 <- read_csv("Originales/202202-tripdata.csv")
marzo_2022 <- read_csv("Originales/202203-tripdata.csv")
abril_2022 <- read_csv("Originales/202204-tripdata.csv")
mayo_2022 <- read_csv("Originales/202205-tripdata.csv")
junio_2022 <- read_csv("Originales/202206-tripdata.csv")

#Seleccionando solo los datos que se utilizaran en el trabajo

julio_2021 <- julio_2021 %>% 
  select(ride_id,rideable_type,started_at,ended_at,start_station_id,end_station_id,member_casual )
agosto_2021 <- agosto_2021 %>% 
  select(ride_id,rideable_type,started_at,ended_at,start_station_id,end_station_id,member_casual )
septiembre_2021 <- septiembre_2021 %>% 
  select(ride_id,rideable_type,started_at,ended_at,start_station_id,end_station_id,member_casual )
octubre_2021 <- octubre_2021 %>% 
  select(ride_id,rideable_type,started_at,ended_at,start_station_id,end_station_id,member_casual )
noviembre_2021 <- noviembre_2021 %>% 
  select(ride_id,rideable_type,started_at,ended_at,start_station_id,end_station_id,member_casual )
diciembre_2021 <- diciembre_2021 %>% 
  select(ride_id,rideable_type,started_at,ended_at,start_station_id,end_station_id,member_casual )
enero_2022 <- enero_2022 %>% 
  select(ride_id,rideable_type,started_at,ended_at,start_station_id,end_station_id,member_casual )
febrero_2022 <- febrero_2022 %>% 
  select(ride_id,rideable_type,started_at,ended_at,start_station_id,end_station_id,member_casual )
marzo_2022 <- marzo_2022 %>% 
  select(ride_id,rideable_type,started_at,ended_at,start_station_id,end_station_id,member_casual )
abril_2022 <- abril_2022 %>% 
  select(ride_id,rideable_type,started_at,ended_at,start_station_id,end_station_id,member_casual )
mayo_2022 <- mayo_2022 %>% 
  select(ride_id,rideable_type,started_at,ended_at,start_station_id,end_station_id,member_casual )
junio_2022 <- junio_2022 %>% 
  select(ride_id,rideable_type,started_at,ended_at,start_station_id,end_station_id,member_casual )

#Creando la columna ride_length que nos muestra la duracion de cada viaje

julio_2021 <- julio_2021 %>% 
  mutate(ride_length = hms::as_hms(ended_at - started_at))
agosto_2021 <- agosto_2021 %>% 
  mutate(ride_length = hms::as_hms(ended_at - started_at))
septiembre_2021 <- septiembre_2021 %>% 
  mutate(ride_length = hms::as_hms(ended_at - started_at))
octubre_2021 <- octubre_2021 %>% 
  mutate(ride_length = hms::as_hms(ended_at - started_at))
noviembre_2021 <- noviembre_2021 %>% 
  mutate(ride_length = hms::as_hms(ended_at - started_at))
diciembre_2021 <- diciembre_2021 %>% 
  mutate(ride_length = hms::as_hms(ended_at - started_at))
enero_2022 <- enero_2022 %>% 
  mutate(ride_length = hms::as_hms(ended_at - started_at))
febrero_2022 <- febrero_2022 %>% 
  mutate(ride_length = hms::as_hms(ended_at - started_at))
marzo_2022 <- marzo_2022 %>% 
  mutate(ride_length = hms::as_hms(ended_at - started_at))
abril_2022 <- abril_2022 %>% 
  mutate(ride_length = hms::as_hms(ended_at - started_at))
mayo_2022 <- mayo_2022 %>% 
  mutate(ride_length = hms::as_hms(ended_at - started_at))
junio_2022 <- junio_2022 %>% 
  mutate(ride_length = hms::as_hms(ended_at - started_at))

#Creando la columna que nos indica que dia de la semana se realiza cada viaje

julio_2021 <- julio_2021 %>% 
  mutate(day_of_week = wday(started_at,label = TRUE,abbr = FALSE) )
agosto_2021 <- agosto_2021 %>% 
  mutate(day_of_week = wday(started_at,label = TRUE,abbr = FALSE) )
septiembre_2021 <- septiembre_2021 %>% 
  mutate(day_of_week = wday(started_at,label = TRUE,abbr = FALSE) )
octubre_2021 <- octubre_2021 %>%
  mutate(day_of_week = wday(started_at,label = TRUE,abbr = FALSE) )
noviembre_2021 <- noviembre_2021 %>% 
  mutate(day_of_week = wday(started_at,label = TRUE,abbr = FALSE) )
diciembre_2021 <- diciembre_2021 %>% 
  mutate(day_of_week = wday(started_at,label = TRUE,abbr = FALSE) )
enero_2022 <- enero_2022 %>% 
  mutate(day_of_week = wday(started_at,label = TRUE,abbr = FALSE) )
febrero_2022 <- febrero_2022 %>%
  mutate(day_of_week = wday(started_at,label = TRUE,abbr = FALSE) )
marzo_2022 <- marzo_2022 %>% 
  mutate(day_of_week = wday(started_at,label = TRUE,abbr = FALSE) )
abril_2022 <- abril_2022 %>% 
  mutate(day_of_week = wday(started_at,label = TRUE,abbr = FALSE) )
mayo_2022 <- mayo_2022 %>% 
  mutate(day_of_week = wday(started_at,label = TRUE,abbr = FALSE) )
junio_2022 <- junio_2022 %>% 
  mutate(day_of_week = wday(started_at,label = TRUE,abbr = FALSE) )

#Escribiendo archivos .csv se estos nuevos datos

write_csv(julio_2021,file = "2021_07_clean.csv")
write_csv(agosto_2021 ,file = "2021_08_clean.csv")
write_csv(septiembre_2021 ,file = "2021_09_clean.csv")
write_csv(octubre_2021,file = "2021_10_clean.csv")
write_csv(noviembre_2021,file = "2021_11_clean.csv")
write_csv(diciembre_2021,file = "2021_12_clean.csv")
write_csv(enero_2022,file = "2022_01_clean.csv")
write_csv(febrero_2022,file = "2022_02_clean.csv")
write_csv(marzo_2022,file = "2022_03_clean.csv")
write_csv(abril_2022,file = "2022_04_clean.csv")
write_csv(mayo_2022,file = "2022_05_clean.csv")
write_csv(junio_2022,file = "2022_06_clean.csv")
