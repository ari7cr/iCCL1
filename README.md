# iCCL1

To install:

````
if (!require(devtools)) {
  install.packages("devtools")
}

devtools::install_github("ari7cr/iCCL1")
library(iCCL1)
````
Flowchart:

<a href="https://imgur.com/Km0QXPh"><img src="https://i.imgur.com/Km0QXPh.png" title="source: imgur.com" /></a>

Functions:  
1. predictdimensions(SeuratObject) -> gives back an estimated Dimension to run clustering for   

2. iCCL(SeuratObject, x, y)  
Basically Seurat clustering for your SeuratObject from the range of x (>3) to y.


<b> This Package is currently undergoing maintenace for improving </b>  
Planned for iCCL2: t-SNE adaption  

Long-Term goals: Clustering Scores (ideas and participation very much appreciated!)  

<br>
<br>


This package builds upon Seurat methods:
https://www.biorxiv.org/content/10.1101/2020.10.12.335331v1

The method which predictdimension() builds on was developed by Harvard Chan Bioinformatics Core:
https://bioinformatics.sph.harvard.edu/  

Arian Abbasi  
abbasi@hhu.de  
University of Cologne  
