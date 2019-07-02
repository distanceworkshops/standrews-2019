---
title: Distance Sampling Workshops 2019
layout: index

---

# Distance Sampling Workshops 2019

This is the site for the Distance Sampling Workshops given in St Andrews, 19th - 30th August, 2019. The course is in three parts:


- Introduction to R for Distance Sampling, 19th–20th August
- Introduction to Distance Sampling, 21st–23rd August
- Advanced Distance Sampling, 26th–30th August



## Course materials

- Introduction to R for Distance Sampling
  - [Slides](R/slides.html)
  - [Practical session exercises and data](R/practicals.html)
- Introduction to Distance Sampling
  - [Slides](intro/slides.html)
  - [Practical session exercises and data](intro/practicals.html)
- Advanced Distance Sampling
  - [Slides](adv/slides.html)
  - [Practical session exercises and data](adv/practicals.html)

There is also a [bibliography](bibliography.html) listing additional useful publications.


## Schedule

To come!

## Refresher of distance sampling concepts

The introductory distance sampling course (previously delivered in St Andrews) is [now online for free](https://workshops.distancesampling.org/online-course/).


## Software

Participants are encouraged to bring their own laptops to use during the workshop practicals. R will be used. To ensure your computer is setup correctly prior to the workshop please check the instructions below.

### R

The course will use R, RStudio and various R packages to be installed from CRAN. The following steps should setup your computer for the workshop:

1. Install R from [the R website](https://cran.rstudio.com/)
2. Install RStudio from [the RStudio website](http://www.rstudio.com/products/rstudio/download/)
3. Open RStudio and install R packages using the following command (cut and paste into the Editor window and submit):

```{r}
install.packages(c("mrds", "Distance", "dsm", "DSsim", "ggplot2", "rgdal", "knitr",
                   "plyr", "raster", "reshape2", "viridis", "htmltools",
                   "caTools", "bitops", "rmarkdown", "tweedie", "shapefiles"))
```

There may be quite a lot of packages downloaded in this process, including many not listed here because the packages listed depend upon many other packages.



