####################################################################
#Calculating Variogram of Remote Sensing Image Data
#This code is contributed by Milad Mahour for educational purposes
#Email: m.mahour@utwente.nl
####################################################################
rm(list=ls(all=TRUE))
#Loading "rgdal" library for reading image data
require(rgdal)
#Loading "gstat" library for variogram function
require(gstat)

#Defining the root directory
Root <- "D:/Programming"
setwd(Root)

inputfile <- "Test.tif"
A <- readGDAL(inputfile)	
names(A)<- "Test"
head(A@data)
summary(A$Test)

#Make spatial point data frame
point_data <- as(A, 'SpatialPointsDataFrame')

#Computing Variogram at four main geographical direction 0, 45, 90 and 135 and cutoff value at 6000 m
file.d4 <- variogram(Test~1, data=point_data, alpha=c(0,45,90,135), cutoff=6000)
file.d4

#Plot four directional variogram
plot(file.d4)
