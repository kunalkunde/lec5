setwd("C:/Users/Kunal Kunde/OneDrive/Documents/SOM 660/Lec 5")
library(lpSolve)
library(readr)
direction <- read_tsv("directionLEC5.txt",col_names = FALSE)
constraintsMatrix <- read_tsv("constraintsMatrixLEC5.txt",col_names = FALSE)
rightHandSide <- read_tsv("rhsLEC5.txt",col_names = FALSE)
objectiveFunctionCoefficients <- read_tsv("objFnCoeffLEC5.txt",col_names = FALSE)
my_SOM660_LP2_Lec5 <- lp(direction = "max", objective.in = objectiveFunctionCoefficients, const.mat = constraintsMatrix, const.dir = direction, const.rhs = rightHandSide, transpose.constraints = TRUE)
my_SOM660_LP2_Lec5$solution