###
#  Created on Mon Oct  15
#
#  @author: zheng zhang
#  @purpose: to plot finger print annotation files by classes
#            a customized version of ChemRICH interactive and impact plot for ucsd use
#
#  @reference: Barupal, D.K. and Fiehn, ChemRICH, (2017)
#              GitHub repository, https://github.com/barupal/ChemRICH
###

library("ggplot2")
library(ggrepel)
library(magrittr)
library(plotly)
library(htmlwidgets)

project_name <- "Plot_Classes"

# fix the files with xlogp for each feature
# change test_plot.txt to your customized input annotation file
system('RScript prepareXlogp.R input_files/test_plot.txt')
print('Fixed Xlogp. Check the result in intermediate_files/with_xlogp.csv')

# rewrite the input files in to plotable format.
# change t_test.csv and fold_change.csv to your customized input annotation file
# for details, check prepare_form.py
system('python prepare_form.py input_files/t_test.csv input_files/fold_change.csv')
print('Prepared the plotable format. Check the result in intermediate_files/format_toplot.csv')

# plot the inpact plot and interactive plot
inputdf <- read.csv(file="intermediate_files/format_toplot.csv", header=TRUE, sep=",")
source('plot_methods.R')
impactPlot(inputdf)
print('Finished static plot. Check the result in plots/Plot_Classes_impact_plot.png')
interactivePlot(inputdf)
print('Finished interactive plot. Check the result in plots/Plot_Classes_interactive.html')
