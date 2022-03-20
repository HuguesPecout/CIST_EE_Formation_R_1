

#### 4. créez votre projet Rstudio #### 



#### 5. Créez un fichier script #### 

# Dans la console :
# file.create("Mon_script.R")



#### 6. Créez le sous-répertoire "data" #### 

dir.create("data")



#### 7. Téléchargement et écriture des données dans "data" #### 

download.file(url = "https://sharedocs.huma-num.fr/wl/?id=OIdQC31yRfOfrXLPqCfWCxhNffoVrNXj&mode=grid&download=1",
              destfile = "data/wb_don_1990_2019.xls", method = "curl"  )



#### 8.  ####

# install.packages("readxl")




#### 9.  ####

library(readxl)



#### 10.  ####

my_data <- read_xls(path = "data/wb_don_1990_2019.xls", sheet = 3)


#### 11.  ####

View(my_data)
# Nombre de ligne du tableau :
nrow(my_data)
# Nombre de colonnes
ncol(my_data)
# Nombre de lignes et de colonnes :
dim(my_data)
# Noms des colonnes du tableau :
colnames(my_data)


#### 12.  ####


my_select <- my_data[my_data$region %in% "Sub-Saharan Africa", 1:13]

# OU 

my_select <- subset(x = my_data,  
                    subset = region %in% "Sub-Saharan Africa", 
                    select = 1:13)



#### 13.  ####

sum(my_select$POP, na.rm = TRUE)




#### 14.  ####

plot(x = my_select$GDP, 
     y = my_select$POP,
     col= "red",
     pch = 20,
     cex = 0.8)



#### 15.  ####

write.csv(x = my_select, file = "data/my_select.csv")


