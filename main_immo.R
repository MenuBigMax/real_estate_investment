rm(list=ls())

library(shiny)
library(reshape2)
library(ggplot2)


setwd('/Users/maxime/Onedrive/PROJET/IMMO/script')

source('include/immo_function.R')
shinyAppDir(appDir = 'shiny')
