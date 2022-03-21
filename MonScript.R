

#### 4. créez votre projet Rstudio #### 



#### 5. Créez un fichier script #### 

# Dans la console :
# file.create("Mon_script.R")



#### 6. Créez le sous-répertoire "data" #### 

dir.create("data")



#### 7. Téléchargement et écriture des données dans "data" #### 

download.file(url = "https://sharedocs.huma-num.fr/wl/?id=OIdQC31yRfOfrXLPqCfWCxhNffoVrNXj&mode=grid&download=1",
              destfile = "data/wb_don_1990_2019.xls", method = "curl"  )



#### 8. Installation du package readxl ####

# install.packages("readxl")




#### 9. Chargement de la librairie ####

library(readxl)



#### 10. Import de l'onglet 3 du fichier wb_don_1990_2019.xls ####

my_data <- read_xls(path = "data/wb_don_1990_2019.xls", sheet = 3)



#### 11. Exploration du tableau importé ####

# Visualiser le tableau dans l'IDE Rstudio :
View(my_data)
# Nombre de lignes du tableau :
nrow(my_data)
# Nombre de colonnes
ncol(my_data)
# Nombre de lignes et de colonnes :
dim(my_data)
# Noms des colonnes du tableau :
colnames(my_data)



#### 12.  Séléction des pays sub-saharien et des colonnes de 1 à 13 ####


my_select <- my_data[my_data$region %in% "Sub-Saharan Africa", 1:13]

# OU 

my_select <- subset(x = my_data,  
                    subset = region %in% "Sub-Saharan Africa", 
                    select = 1:13)




#### 13. Calcul de la population totale ####

sum(my_select$POP, na.rm = TRUE)




#### 14. Représentation graphique (x = GDP et y = POP)  ####

plot(x = my_select$GDP, 
     y = my_select$POP,
     col= "red",
     pch = 20,
     cex = 0.8)




#### 15. Enregistrement du tableau modifié dans un fichier csv ####

write.csv(x = my_select, file = "data/my_select.csv")


