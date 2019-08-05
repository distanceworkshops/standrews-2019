---
title: Practical exercises
layout: index

---

# Practical exercises

Here you can find the exercises for the practical sessions during the course. All content will remain here on the Distance website for future consultation.

## Practicals

Practicals are provided in [RMarkdown](http://rmarkdown.rstudio.com/index.html) (`.Rmd`) format. RMarkdown can be opened in [RStudio](https://www.rstudio.com/) and the file "knitted" into HTML or PDF.

Note that the practicals are designed to be run sequentially, files generated from previous analyses are loaded and used in subsequent analyses.

Number | Practical Description                            | Practical                                                                                 | Solution                                                                                                      |
-------|--------------------------------------------------|-------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------|
1      | R tutorial (see [this page](R_tutorial.html))     |                                                                                           |                                                                                                               |
2      | Processing sperm whale data                      | [Rmd](practicals/02-process-geodata.Rmd)     [PDF](practicals/02-process-geodata.pdf)     |                                                                                                               |
3      | Fitting detection functions                      | [Rmd](practicals/03-detection-functions.Rmd) [PDF](practicals/03-detection-functions.pdf) | [Rmd](practicals/03-detection-functions-solutions.Rmd) [PDF](practicals/03-detection-functions-solutions.pdf) |
4      | Fitting DSMs                                     | [Rmd](practicals/04-simple-dsms.Rmd)         [PDF](practicals/04-simple-dsms.pdf)         | [Rmd](practicals/04-simple-dsms-solutions.Rmd)         [PDF](practicals/04-simple-dsms-solutions.pdf)         |
5      | Multiple term DSMs, model checking and selection | [Rmd](practicals/05-advanced-dsms.Rmd)       [PDF](practicals/05-advanced-dsms.pdf)       | [Rmd](practicals/05-advanced-dsms-solutions.Rmd)       [PDF](practicals/05-advanced-dsms-solutions.pdf)       |
6      | DSM Prediction                                   | [Rmd](practicals/06-prediction.Rmd)          [PDF](practicals/06-prediction.pdf)          | [Rmd](practicals/06-prediction-solutions.Rmd)          [PDF](practicals/06-prediction-solutions.pdf)          |
7      | DSM Variance                                     | [Rmd](practicals/07-variance.Rmd)            [PDF](practicals/07-variance.pdf)            | [Rmd](practicals/07-variance-solutions.Rmd)            [PDF](practicals/07-variance-solutions.pdf)            |
8      | Mark-recapture distance sampling                 | [Rmd](practicals/08-mrds.Rmd) [R PDF](practicals/08-mrds.pdf)                   | [Rmd](practicals/08-mrds_solutions.Rmd) [PDF](practicals/08-mrds_solutions.pdf) |
9      | Simulation of distance sampling data             | [Rmd](practicals/09-DSsim.Rmd) [PDF](practicals/09-DSsim.pdf)                              |  |

## Data sets

Data for the practicals come in a variety of forms for analysis both in R and in Distance 7.

### Data for density surface modelling (Practicals 2-7)

To run the sperm whale analysis you'll need to download the following files, unzip them and store the unzipped folders in the same directory as the `Rmd` files for practicals 5-10 above:

- [Analysis.gdb](practicals/Analysis.gdb.zip)
- [Covariates_for_Study_Area.zip](practicals/Covariates_for_Study_Area.zip)

The Distance 7 project containing these data can be downloaded [from this location](practicals/spermwhale-Dist7.zip)

We'd like to thank Jason Roberts of Duke University for preparing these files in ArcGIS with the [MGET Toolbox](http://mgel2011-kvm.env.duke.edu/mget/).

### Data for double platform analysis (Practical 8)

For R users you just need the `csv` files:

- [Crabeater seals MRDS `csv`](practicals/crabbieMRDS.csv).
- [Crabeater seals MCDS `csv`](practicals/crabbieMCDS.csv).

For Distance for Windows users, project files can be downloaded here:

- [Crabbie MRDS Exercise Distance project](practicals/CrabbieMRDSExercise.zip)
- [Crabbie MCDS Exercise Distance project](practicals/CrabbieMCDSExercise.zip)
- [Golftees Exercise Distance project](practicals/GolfteesExercise.zip)


### Data for simulation (Practical 9)

[zip archive](practicals/Distance_simulation_exercise.zip) of R practical materials.


## Problems

If you run into a problem running any of these examples, please report [an issue on this GitHub repository](https://github.com/distanceworkshops/standrews-2019/issues). Or contact the workshop instructors.


