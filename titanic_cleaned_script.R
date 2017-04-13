##Replace the NA in embarked column with S for Southampton
titanic_original$embarked[is.na(titanic_original$embarked)] <- "S"

#replace the NA ages with the mean age
mean_age <- mean(titanic_original$age, na.rm=TRUE)
titanic_original$age[is.na(titanic_original$age)] <- mean_age

#replace missing values for passengers who didnt make it to lifeboats
titanic_original$boat[is.na(titanic_original$boat)] <- "noboat"

##new column hascabinnumber with values 0 or 1
titanic_original %>% mutate(has_cabin_number = cabin)
titanic_original <- titanic_original %>% mutate(has_cabin_number = cabin)
titanic_original$has_cabin_number[!is.na(titanic_original$has_cabin_number)] <- 1
titanic_original$has_cabin_number[is.na(titanic_original$has_cabin_number)] <- 0
