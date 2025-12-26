# Make for Repo Upload
# Directory to get original data
setwd("D:/THESIS/Pitch_Diagnostics_Data/compiledData/Human/")

# Load libraries ----------------------------------------------------------
# uses tidyverse package 
library(tidyverse)

# Load Data ---------------------------------------------------------------
ardc <- read_csv("./Data_ARDC.csv")
info <- read_csv("./Data_SubjectInfo.csv")

audio <- left_join(ardc, info, join_by("Subject"))
audio2 <- audio %>% select(Subject, Age, Gender, date, 6:43)

audio3 <- audio2 %>%
  pivot_longer(
    cols = 5:42,  # adjust if needed
    names_to = c("type", "ear", "frequency"),
    names_pattern = "(AC|BC)_(R|L)_(\\d+)",
    values_to = "threshold"
  ) %>%
  mutate(frequency = as.numeric(frequency))

write_csv(audio3, "C:/Users/saman/Desktop/Data/human_audiogram_data.csv")


# OAE Data ----------------------------------------------------------------
oae <- read_csv("./Data_DPOAE.csv")
oae2 <- oae %>% 
  pivot_longer(
    cols = 5:22, 
    names_to = c("measure", "frequency"), 
    names_pattern = "(DP|NF)_(\\d+)", 
    values_to = "amplitude"
  ) %>% 
  mutate(frequency = as.numeric(frequency)) %>% 
  pivot_wider(
    names_from = measure, 
    values_from = amplitude)

oae2 <- oae2 %>% subset(FPL_cal == 1) 
oae3 <- oae2[,-c(2,4)]

write_csv(oae3, "C:/Users/saman/Desktop/Data/human_oae_data.csv")

oae <- read_csv("D:/THESIS/Pitch_Diagnostics_Data/compiledData/Chin/Data_DPOAE.csv")
oae2 <- oae %>% 
  pivot_longer(
    cols = 4:21, 
    names_to = c("measure", "frequency"), 
    names_pattern = "(DP|NF)_(\\d+)", 
    values_to = "amplitude"
  ) %>% 
  mutate(frequency = as.numeric(frequency)) %>% 
  pivot_wider(
    names_from = measure, 
    values_from = amplitude)
oae2$ear <- "R"


write_csv(oae2, "C:/Users/saman/Desktop/Data/chinchilla_oae_data.csv")


#######################################
# Make for Repo Upload
setwd("D:/fromBox/Compiled/")
# Load libraries ----------------------------------------------------------

library(tidyverse)

ardc <- read_csv("./Data_ARDC_SH.csv")

audio2 <- ardc %>% select(SubjectID, date, 9:46)

audio3 <- audio2 %>%
  pivot_longer(
    cols = 3:40,  # adjust if needed
    names_to = c("type", "ear", "frequency"),
    names_pattern = "(AC|BC)_(R|L)_(\\d+)",
    values_to = "threshold"
  ) %>%
  mutate(frequency = as.numeric(frequency))

write_csv(audio3, "C:/Users/saman/Desktop/Data/human_audiogram_data_ardc.csv")

oae <- ardc %>% select(SubjectID, date, 63:86)

oae2 <- oae %>% 
  pivot_longer(
    cols = 3:26, 
    names_to = c("measure", "ear", "frequency"), 
    names_pattern = "(dp|nf)_(R|L)_(\\d+)", 
    values_to = "amplitude"
  ) %>% 
  mutate(frequency = as.numeric(frequency)) %>% 
  pivot_wider(
    names_from = measure, 
    values_from = amplitude)

write_csv(oae2, "C:/Users/saman/Desktop/Data/human_oae_data_ardc.csv")

memr <- ardc %>% select(SubjectID, date, 47:62)

oae2 <- memr %>% 
  pivot_longer(
    cols = 3:18, 
    names_to = c( "ear", "condition", "frequency"), 
    names_pattern = "reflex_(R|L)_(ipsi|contra)_(\\d+)", 
    values_to = "threshold"
  ) %>% 
  mutate(frequency = as.numeric(frequency)) 

write_csv(oae2, "C:/Users/saman/Desktop/Data/human_memr_data_ardc.csv")


## ABR Thresholds
# Make for Repo Upload
setwd("C:/Users/saman/Desktop/Chin/")
# Load libraries ----------------------------------------------------------

library(tidyverse)

abr <- read_csv("./Data_ABR.csv")

audio3 <- abr %>%
  pivot_longer(
    cols = 5:9, 
    names_to = c("frequency"),
    names_pattern = "ABR_thresh_(\\d+)",
    values_to = "threshold"
  ) %>%
  mutate(frequency = as.numeric(frequency))

write_csv(audio3, "C:/Users/saman/Desktop/Data/chin_abr_thresholds.csv")
