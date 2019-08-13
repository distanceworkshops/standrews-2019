---
title: Distance Sampling Workshops 2019
layout: index

---

# Distance Sampling Workshops 2019

This is the site for the Distance Sampling Workshops given in St Andrews, 19th - 30th August, 2019. The course is in three parts:


- Introduction to R for Distance Sampling, 19th - 20th August
- Introduction to Distance Sampling, 21st - 23rd August
- Advanced Distance Sampling, 26th - 30th August



## Course materials

- Introduction to R for Distance Sampling
  - [R materials](R/index.html)
- Introduction to Distance Sampling
  - [Slides](intro/slides.html)
  - [Practical session exercises and data](intro/practicals.html)
  - [Bibliography](intro/bibliography.html)
- Advanced Distance Sampling
  - [Slides](adv/slides.html)
  - [Practical session exercises and data](adv/practicals.html)


## Schedule

### Introduction to R for Distance Sampling

Day | Time | Activity
-------|-------|--------------------------
Monday | 08:45 | Registration open
Monday | 09:00-17:00 | Welcome and setup<br/>Data types<br/>Using R in context<br/>Control structures
Tuesday | 09:00-17:00 | Basic functions<br/>Plots<br/>Introduction to statistical modelling


### Introduction to Distance Sampling
 
Day | Time | Activity
-------|-------|--------------------------
Wednesday | 08:45 | Registration open
Wednesday | 09:00 - 17:30 | Welcome<br/>Estimating animal abundance<br/>Distance sampling<br/>Goodness of fit<br/>Precision
Thursday | 09:00 - 17:30 | Point transects<br/>Survey design<br/>Stratification<br/>Multiple covariate distance sampling
Friday | 09:00 - 17:00 | Indirect methods and multipliers<br/>Field methods<br/>Wrap up


### Advanced topics in Distance Sampling

Day | Time | Activity
-------|-------|--------------------------
Monday | 08:45 |Registration open
Monday | 09:00 - 17:00 | Welcome<br/>Review of distance sampling<br/>Density surface modelling
Tuesday | 09:00 - 17:00 | Density surface modelling
Wednesday | 09:00 - 17:00 | Density surface modelling
Thursday | 09:00 - 17:00 | Mark-recapture distance sampling<br/>Distance sampling simulation and survey design
Friday | 09:00 - 17:00 | Research topics<br/>Open


## Refresher of distance sampling concepts

The introductory distance sampling course (previously delivered in St Andrews) is [now online for free](https://workshops.distancesampling.org/online-course/).


## Software

Participants are encouraged to bring their own laptops to use during the workshop practicals. R will be used. To ensure your computer is setup correctly prior to the workshop please check the instructions below.

The course will use R, RStudio and various R packages to be installed from CRAN. The following steps should setup your computer for the workshop:

1. Install R from [the R website](https://cran.rstudio.com/)
2. Install RStudio from [the RStudio website](http://www.rstudio.com/products/rstudio/download/)
3. Open RStudio and install R packages using the following commands:

```{r}
# install necessary packages from CRAN
install.packages(c("optimx", "numDeriv", "Rsolnp", "pander", "dplyr",
                   "mrds", "Distance", "dsm", "DSsim", "dssd",
                   "ggplot2", "rgdal", "knitr", "plyr", "raster", "reshape2", "viridis",
                   "bitops", "rmarkdown", "tweedie", "shapefiles", "remotes"))

# install newer versions of the Distance packages from
# github
remotes::install_github("DistanceDevelopment/mrds", type="CRAN")
remotes::install_github("DistanceDevelopment/Distance", type="CRAN")
remotes::install_github("DistanceDevelopment/dsm", type="CRAN")
remotes::install_github("DistanceDevelopment/dsdata", type="CRAN")
```

There may be quite a lot of packages downloaded in this process, including many not listed here because the packages listed depend upon many other packages. It's best to run these one line at a time, in case R needs confirmation between steps.



