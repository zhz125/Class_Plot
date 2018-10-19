# Class_Plot
Customized ChemRICH Plot for UCSD use.

![Example Plot](https://github.com/zhz125/Class_Plot/blob/master/Example_input%2Boutput/plots/Plot_Classes_impact_plot.png)

***
## Reference:
[Barupal, D.K. and Fiehn, O., 2017. Chemical Similarity Enrichment Analysis (ChemRICH) as alternative to biochemical pathway mapping for metabolomic datasets Scientific Report 2017. (https://www.nature.com/articles/s41598-017-15231-w)</br>
github: https://github.com/barupal/ChemRICH
***
## Plot Intepretation 
* x-axis : median of the feature xlogp in the class
* y-axis : negative log of the class p-value 
* color code : fold change ratio, i.e. ratio of feature of the class increased
***
## input
* Feature Annotation File: [see input_files/test_plot.txt] </br>
* T test result : [see input_files/t_test.csv] </br>
* fold change result : [see input_files/fold_change.csv] </br>
***
## output
* static plot :  [see plots/Plot_Classes_impact_plot.png] </br>
* interactive plot :  [see plots/Plot_Classes_interactive.html] </br>
* table for plot :  [see intermediate_files/fold_change.csv] </br>
* table of features included in the plot :  [see intermediate_files/features_included_in_plots.csv] </br>
* table of features from input annotation file paired with xlogp:  [see intermediate_files/with_xlogp.csv] </br>
***
## To Run
* Put input files into folder input_files 
* "RScript main.R"
***

