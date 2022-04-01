## ----lib----------------------------------------------------------------------
library(manydata)

## ----discover, eval=FALSE-----------------------------------------------------
#  get_packages()

## ----load---------------------------------------------------------------------
data(package = "manydata")
data(emperors, package = "manydata")
emperors

## ----pluck--------------------------------------------------------------------
wikipedia <- pluck(emperors, "wikipedia")

## ----source-------------------------------------------------------------------
data_source(pkg = "manydata", database = NULL, dataset = NULL)

## ----contrast-----------------------------------------------------------------
data_contrast(pkg = "manydata", database = NULL, dataset = NULL)

## ----compare, message=FALSE, warning=FALSE------------------------------------
library(dplyr)
emperors %>% 
  purrr::map(function(x){
    x %>% dplyr::filter(!duplicated(ID)) %>%
      dplyr::summarise(mean(Beg, na.rm = TRUE))
  })

## ----consolidate--------------------------------------------------------------
consolidate(database = emperors, rows = "any", cols = "any", resolve = "coalesce", key = "ID")
consolidate(database = emperors, rows = "every", cols = "every", resolve = "coalesce", key = "ID")

## ----resolve------------------------------------------------------------------
consolidate(database = emperors, rows = "any", cols = "every", resolve = "max", key = "ID")
consolidate(database = emperors, rows = "every", cols = "any", resolve = "min", key = "ID")
consolidate(database = emperors, rows = "every", cols = "every", resolve = "mean", key = "ID")
consolidate(database = emperors, rows = "any", cols = "any", resolve = "median", key = "ID")
consolidate(database = emperors, rows = "every", cols = "every", resolve = "random", key = "ID")

## ----different----------------------------------------------------------------
consolidate(database = emperors, rows = "any", cols = "every", resolve = c(Beg = "min", End = "max"), key = "ID")

## ----favour-------------------------------------------------------------------
consolidate(database = favour(emperors, "UNRV"), rows = "every", cols = "any", resolve = "coalesce", key = "ID")

## ----multiple-----------------------------------------------------------------
consolidate(database = emperors, rows = "any", cols = "any", resolve = c(Death = "max", Cause = "coalesce"),
            key = c("ID", "Beg"))

