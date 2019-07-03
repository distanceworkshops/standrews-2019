# 4 variance estimation

library(Distance)
library(dsdata)
library(fancy)

data(Systematic_variance_2)

# how to convert units
convert.units <- Systematic_variance_2_units
cu <- convert.units[, 3]
cu <- 1/(cu[3]/(cu[1]*cu[2]))


# first fit a model
sysvar_df <- ds(Systematic_variance_2, adjustment=NULL, convert.units=cu)


# bootstrap estimate of uncertainty

# get D and N summaries
DNhat_summarize_indiv <- function(ests, fit){
  return(c(N=ests$individuals$N$Estimate,
           D=ests$individuals$D$Estimate))
}

# run the bootstrap (this takes a while!)
boots <- fiddlydht(sysvar_df, flatfile=Systematic_variance_2,
                   summary_fun=DNhat_summarize_indiv, convert.units=cu, nboot=999)

# get the median results
summary(boots)

# compare to analytic results
sysvar_df$dht



## post-stratification

## stratified variance estimation by grouping adjacent transects

# fiddle with the data
systematic_var2 <- Systematic_variance_2
unflat <- unflatten(systematic_var2)

# make variance groupings
vargroups <- data.frame(Sample.Label = 1:20,
                        grouping     = sort(rep(1:10, 2)))
unflat$sample.table <- merge(unflat$sample.table, vargroups, by="Sample.Label")

# Remove these labels as they confuse the merge()
unflat$sample.table$Region.Label <- NULL
unflat$obs.table$Region.Label <- NULL

Nhat_strat <- fancydht(sysvar_df, transects=unflat$sample.table,
                       geo_strat=unflat$region.table, observations=unflat$obs.table,
                       strat_formula=~grouping, convert_units=cu, er_est="R3")
Nhat_strat


# with weighting by effort
Nhat_strat_eff <- fancydht(sysvar_df, transects=unflat$sample.table,
                           geo_strat=unflat$region.table, observations=unflat$obs.table,
                           strat_formula=~grouping, convert_units=cu, er_est="R3",
                           weighting="effort")

Nhat_nostrat <- fancydht(sysvar_df, transects=unflat$sample.table,
                         geo_strat=unflat$region.table, observations=unflat$obs.table,
                         strat_formula=~1, convert_units=cu, er_est="R3")
# with weighting by effort
Nhat_nostrat_eff <- fancydht(sysvar_df, transects=unflat$sample.table,
                             geo_strat=unflat$region.table, observations=unflat$obs.table,
                             strat_formula=~1, convert_units=cu, er_est="R3",
                             weighting="effort")

# note the change in component variance %





## when post-stratification isn't needed

data(Systematic_variance_1)

convert.units <- Systematic_variance_1_units
cu <- convert.units[, 3]
cu <- 1/(cu[3]/(cu[1]*cu[2]))



# first fit a model
sysvar1_df <- ds(Systematic_variance_1, adjustment=NULL, convert.units=cu)

# fiddle with the data
systematic_var1 <- Systematic_variance_1
unflat <- unflatten(systematic_var1)

# make variance groupings
vargroups <- data.frame(Sample.Label = 1:20,
                        grouping     = sort(rep(1:10, 2)))
unflat$sample.table <- merge(unflat$sample.table, vargroups, by="Sample.Label")

# Remove these labels as they confuse the merge()
unflat$sample.table$Region.Label <- NULL
unflat$obs.table$Region.Label <- NULL

# was post-stratification necessary?
Nhat_strat <- fancydht(sysvar1_df, transects=unflat$sample.table,
                       geo_strat=unflat$region.table, observations=unflat$obs.table,
                       strat_formula=~grouping, convert_units=cu, er_est="R3")


