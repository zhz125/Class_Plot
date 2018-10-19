###
#  Created on Mon Oct  15
#  @author: zheng zhang
#  @purpose: to plot finger print annotation files by classes
#            a customized version of ChemRICH interactive and impact plot for ucsd use
#  @notice: This two methods are modified based on ChemRICHFunctions.R
#  @reference: Barupal, D.K. and Fiehn, ChemRICH, (2017)
#              GitHub repository, https://github.com/barupal/ChemRICH
#
#  @input: dataframe prepared using prepareXlogp.R and prepare_form.py
#  @output: plots (static:png, interactive:html) in the folder plots
###

#   x-axis represents classes xlogp values (median xlogpg of all the class members)
#   y_axis represents classes -log(classes pvalues)
#   color code: class upratio (found using fold change)
#               red -> class upratio = 1
#               blue -> class upratio = 0
impactPlot <- function(inputdf) {
  p2 <- ggplot(inputdf,aes(x=class_xlogp,y=-log(pvalue)))
  p2 <- p2 + geom_point(aes(size=csize, color=upratio)) +
    scale_color_gradient(low = "blue", high = "red", limits=c(0,1))+
    scale_size(range = c(5, 30)) +
    scale_y_continuous("-log (pvalue)",limits = c(0, max(-log(inputdf$pvalue))+4  )) +
    scale_x_continuous(" median XlogP of clusters ") +
    theme_bw() +
    geom_label_repel(aes(label = classes), color = "gray20",family="Arial",data=subset(inputdf, csize>2),force = 5)+
    theme(text=element_text(family="Arial Black"))+
    theme(
      plot.title = element_text(face="bold", size=30,hjust = 0.5),
      axis.title.x = element_text(face="bold", size=20),
      axis.title.y = element_text(face="bold", size=20, angle=90),
      panel.grid.major = element_blank(), # switch off major gridlines
      panel.grid.minor = element_blank(), # switch off minor gridlines
      legend.position = "none", # manually position the legend (numbers being from 0,0 at bottom left of whole plot to 1,1 at top right)
      legend.title = element_blank(), # switch off the legend title
      legend.text = element_text(size=12),
      legend.key.size = unit(1.5, "lines"),
      legend.key = element_blank(), # switch off the rectangle around symbols in the legend
      legend.spacing = unit(.05, "cm"),
      axis.text.x = element_text(size=10,angle = 0, hjust = 1),
      axis.text.y = element_text(size=15,angle = 0, hjust = 1)
    )
  dir.create(file.path('plots'), showWarnings = FALSE)
  setwd(file.path('plots'))
  ggsave(paste0(project_name,"_impact_plot.png"), p2,height = 8, width = 12, dpi=300)
  setwd("..")
}


interactivePlot <- function(clusterdf) {
    p2 <- ggplot(inputdf,aes(label=classes,label2=pvalue, label3=csize,label4=compounds_names))
    p2 <- p2 + geom_point(aes(x=class_xlogp,y=-log(pvalue),size=csize, color=upratio)) +
    scale_color_gradient(low = "blue", high = "red", limits=c(0,1))+
    scale_size(range = c(5, 30)) +
    scale_y_continuous("-log (pvalue)",limits = c(0, max(-log(inputdf$pvalue))+5  )) +
    scale_x_continuous(" median XlogP of clusters ") +
    theme_bw() +
    #labs(title = "ChemRICH cluster impact plot") +
    geom_text(aes(x=class_xlogp,y=-log(pvalue),label = classes), color = "gray20",data=subset(inputdf, csize>2))+
    theme(
    plot.title = element_text(face="bold", size=30,hjust = 0.5),
    axis.title.x = element_text(face="bold", size=20),
    axis.title.y = element_text(face="bold", size=20, angle=90),
    panel.grid.major = element_blank(), # switch off major gridlines
    panel.grid.minor = element_blank(), # switch off minor gridlines
    legend.position = "none", # manually position the legend (numbers being from 0,0 at bottom left of whole plot to 1,1 at top right)
    legend.title = element_blank(), # switch off the legend title
    legend.text = element_text(size=12),
    legend.key.size = unit(1.5, "lines"),
    legend.key = element_blank(), # switch off the rectangle around symbols in the legend
    legend.spacing = unit(.05, "cm"),
    axis.text.x = element_text(size=15,angle = 0, hjust = 1),
    axis.text.y = element_text(size=15,angle = 0, hjust = 1)
    )
    gg <- ggplotly(p2,tooltip = c("label","label2","label4"), width = 1600, height = 1000)
    dir.create(file.path('plots'), showWarnings = FALSE)
    setwd(file.path('plots'))
    saveWidget(gg,file = paste0(project_name, "_interactive.html"), selfcontained = T)
    setwd("..")
}


