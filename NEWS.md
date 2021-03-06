# manydata 0.7.5

## Package

* Removed `{skimr}` table from `emperors` database documentation
* Updated path for binaries in push release GitHub actions

# manydata 0.7.4

## Package

* Closed #187 by updating GitHub actions to implement package caching
* Closed #209 by removing all non-ASCII characters in package
* Closed #210 by removing `{pkgdown}` dependency
* Updated `emperors` data to contain correct date class name consistent with `{messydates}`

# manydata 0.7.3

## Connection

* Updated how the `get_packages()` function identifies installed packages to avoid using `installed.packages()`
* Updated documentation for `coalesce_compatible()` function to include the returns

# manydata 0.7.2

* Ignored CRAN-SUBMISSION and resubmitted.

# manydata 0.7.1

## Package

* Updated DESCRIPTION by removing ambiguous word from title
* Updated README by correcting the URL for life cycle badge

## Connection

* Updated helper functions for `consolidate()` to use `inherits()` to identify variable's class

# manydata 0.7.0

## Package

* Closed #194 by updating all remaining references from "qID" to "manyID"
* Updated package website
  * Closed #196 by updating elements that configure website to work properly
  * Updated '_pkgdown.yml' file to use bootstrap 5 template to build website

## Connection

* Updated `consolidate()` function
  * Closed #191 by making `consolidate()` function more concise and faster by removing redundant code lines
  * Fixed dates-related warnings by changing how `{messydates}` package is used to resolve dates
  * Updated how `consolidate()` substitutes missing observations with first non-missing observation from other datasets
  * Closed #201 by fixing how `consolidate()` detects variables to be resolved to avoid ambiguous variable matching
  * Closed #202 by allowing for multiple key vectors to be declared as arguments for `consolidate()`
* Closed #199 by adding `favour()` (also `favor()`) function that re-orders datasets within a database

# manydata 0.6.0

## Package

* Closed #189 by renaming package from `{qData}` to `{manydata}`
* Updated user vignette to include more examples on working with `consolidate()`
* Updated package website
* Closed #167 by adding a cheatsheet to README

## Connection

* Updated `consolidate()` function
  * Closed #169 by making default key variable "many_ID" instead of "qID"
  * Closed #183 by adding further methods to resolve conflicts between observations:
    * Added "max" resolve argument which resolves conflicts in favor of the largest non NA value
    * Added "min" resolve argument which resolves conflicts in favor of the smallest non NA value
    * Added "mean" resolve argument which resolves conflicts in favor of the average non NA value
    * Added "median" resolve argument which resolves conflicts in favor of the median non NA value
    * Added "random" resolve argument which resolves conflicts in favor of a random non NA value
  * Closed #185 by making so that users can specify resolve argument differently for different variables
* Closed #188 by adding more informative warnings for GitHub download limits for `get_packages()` function
* Added extraction functions to generate edgelists from agreements membership datasets
  * Added `extract_bilaterals()` for extracting adjacency edgelist for bilateral agreements
  * Added `extract_multilaterals()` for extracting adjacency edgelist for multilateral agreements

# qData 0.5.0

## Package

* Updated `get_packages()` to load downloaded packages
* Closed #160 by updating how report family of functions to print objects only if not assigned
* Updated user vignette for working with `consolidate()`
* Fixed #165 by moving `interleave()` to qCreate
* Closed #149 by adding a citation file
* Closed #181 by adding data for running examples and tests

## Connection

* Closed #28 by adding `consolidate()` for collapsing a set or database of (q)dataset into a single dataset
  * Closed #177 by adding `coalesce_compact()` to coalesce all compatible rows of a data frame
  * Closed #180 by adding progress bar for `coalesce_compact()`
  * Added tests for `consolidate()` and `coalesce_compact()`
* Renamed function for getting first non-missing value `coalesce_rows()`
  * Added tests for `coalesce_rows()`

# qData 0.4.0

## Package

* Separated `{qData}` into two packages, `{qData}` for users and `{qCreate}` for developers
  * Moved `setup_package()` and related functions to `{qCreate}`
  * Moved `import_data()` and related functions to `{qCreate}`
  * Moved `export_data()` and related functions to `{qCreate}`
* Moved `plot_releases()` to `{migraph}`

## Connection

* Closed #137 by making `data_contrast()` and `data_source()` return exportable objects

# qData 0.3.5

## Connection

* Updated `get_packages()` function
  * Fixed bug with dates in `get_packages()` by changing dependencies to `{lubridate}`
  * Updated formatting of the returned tibble to display more clearly the information on qPackages
  * Fixed #144 by substituting `NA` where a listed qPackage is not installed locally

# qData 0.3.4

## Package

* Fixed #128 by suppressing issues with warnings on pkgdown website
* Updated contributor and user vignettes for new package changes

## Collection

* Updated `setup_package()` to make it more intuitive and precise for users
  * Closed #127 by updating the form in which author arguments are taken in `setup_package()`
  * Added role argument to `setup_package()` to make more precise 
  * Closed #139 by reducing file overhead generated by `setup_package()`
  * Simplified `setup_package()` to be less verbose
* Renamed `new_author()` function to `add_author()` for naming consistency
  * Closed #140 by fixing bug with `add_author()`
  * Fixed #121 by allowing `add_author()` to treat multiple comments
* Updated documentation for `setup_package()` and `add_author()`

## Correction

* Updated `standardise_dates()` to simplify function and testing
  * Closed #110 by simplifying helper functions and removing redundancy in `standardise_dates()`
  * Closed #108 by simplifying tests and removing redundancy for `standardise_dates()` 

## Connection

* Divided, updated and renamed `report_data()`  
  * Closed #131 by dividing `report_data()` into `data_source()` and `data_contrast()` functions
  * Closed #104  by allowing users to select multiple datasets with `data_contrast()`
  * Closed #105 by allowing for multiple databases to display in a package with `data_contrast()` 
  * Fixed #111 by removing tests for outdated `report_data()` function

# qData 0.3.3

## Package

* Closed #122 by setting package logo to the correct aspect ratio

## Collection

* Updated `setup_package()` to make it easier to set up collaborative qPackages
  * Closed #106 by making `setup_package()` accept more than two authors as arguments
  * Closed #119 by updating `setup_package()` function so that it adds LICENSE file to new qPackages 
  * Closed #90 by adding a `new_author()` function that adds new package contributors to description file
* Closed #115 by updating README templates for new qPackages to include more sections

## Correction

* Closed #116 by adding more tests for new qPackage templates for standardizing NA formats

## Connection

* Updated `get_packages()` to make it easier to install globalgov qPackages
  * Fixed #117 by making the `get_packages()` work with package name only for qPackages part of the globalgov organization
  * Closed #79 by  updating `get_packages()` to accept listed number for package as arguments
  * Closed #103 by adding GitHub lookup for `depends()` function
* Updated user and developer vignettes to be compatible with these changes

# qData 0.3.2

## Package

* Replaced logo with new 'black box' hex
  * Added open graph image to GitHub account
* Closed #83 by improving CII best practices score
* Added `depends()` for loading and, if necessary, installing CRAN packages
* Added `plot_releases()` function that visualises historical milestones/releases for GitHub repositories
* Updated `setup_package()` function by removing license lines in the codes
  * Fixed #89 by adding different description templates depending on the number of authors declared in `setup_package()`
  * Added 'dtc' contributor type in the DESCRIPTION file

## Collection

* Updated `import_data()` to accept .RData files

## Correction

* Updated and fixed bugs with `standardise_dates()` function and tests
  * Closed #73 `standardise_dates()` function by using `lubridate::as_date()` in place of `anytime::anydate()`
  to correctly treat historical BC and AD dates
  * Fixed #95 by simplifying `standardise_dates()` to make sure it works with all types of date variables
  * Closed #77 and #93 by devolving `standardise_dates()` into various helper functions
* Updated `export_data()` to better document new database and dataset structure 
  * Documentation generated by `export_data()` references the newly created `report_data()` function to 
  generate metadata dataframes at the desired level (Package, Database, Dataset)
  * Closed #76 by adding some smart documentation updates to `export_data()`
  * Closed #92 by tweaking `export_data()` to document datasets at the database level
  * Closed #94 by adding a bibliographic attribute to each dataset with `export_data()`
  * Fixed #63 and #87 by setting up tests templates for the different types of database created
* Added `retain()` to retain chosen objects in the environment, removing all other variables

## Connection

* Closed #78 by creating `report_data()` function that displays information on the data within a qPackage

# qData 0.3.1

## Package

* Closed #81 by changing description of the _Connecting data_ section to include `export_data()` specificities
* Closed #85 by deleting the argument in the function `use_ccby_license(name = packageAuthor)` in the description of the `setup_package()` function
* Corrected the typing error found in "develop" vignette 
* Corrected styling issues in texts (delete double space in files)
* Updated the description of the `export_data()` function to its new version including database name as a string

# qData 0.3.0

## Package 

- Changed package name from qDatr to qData
- Created a hex logo for qData
- Closed #32 by setting up a more informative README document
  - Added codefactor badge
  - Added CII badge, in progress
- Closed #69 by creating a vignette for users working with qData 
- Closed #67 by creating a vignette for developers interested in contributing to the qData ecosystem
- Added pkgdown workflow for updating the website upon release

## Collection

- Updated `import_data()` by suggesting upper case letters for dataset names and lower case letters for database names
  - Now complains if pointed to unrecognised data format

## Correction

- Closed #70 by updating `stadardise_dates()` so that extreme future dates are standardised
  - Updated `standardise_dates()` to accept multiple variable dates as inputs and it standardises separators
  - Updated `standardise_dates()` to be more efficient when dealing with different date formats
- Deprecates `recent()` in favour of `standardise_dates()`
- Updates `export_data()` by making it save datasets as named list elements in a database
- Updates exported test templates for data to test for datasets within databases

## Connection

- Updates `get_packages()` function to:
  - Correctly identify latest release and installed versions
  - Identify registered contributors

# qDatr 0.2.1

## Package

* Fixed #61 by adding tests for `setup_package()` and `import_data()`
* Closed #50 by making sure workflow templates are created in the proper
folder with `setup_package()`

## Correction

* Closed #62 by creating a function which vectorises dates and cleans
and standardizes diverse date formats, `standardise_dates()`
* Closed #55 by deprecating `rearrange()` function in favour of `dplyr::relocate()`
* Closed #65 by correcting issues with the path call in `export_data()` function
  * Ensures consistency for path calls across qData functions

## Connection

* Closed #64 by creating the `get_packages()` function which displays other packages,
and some information about these packages, in the qData ecosystem. The function
serves as a wrapper for downloading qPackages from GitHub.

# qDatr 0.2.0

## Package

* Updated pushrelease.yml to upload all assets individually to release
* ((Tests for following functions on hold...))

## Collection

* Renamed `create_qPackage()` to `setup_package()`
  * Now establishes main testing framework
  * Opens fewer files but is more verbose
  * Closed #51 by trimming dependencies from `qPackage-DESC` template
  * Fixed bug in `qPackage-DESC` that names weren't strings
* Renamed `use_qData_raw()` to `import_data()`
  * Closed #49 with path argument or selector
  * Added delete_original argument (default = FALSE)
  * Closed #58 by extracting file type information from path and adding it and path to preparation template

## Connection

* Renamed `use_qData()` to `export_data()`
  * Avoided reliance on `usethis::use_data()`
  * Fixed bug where it wasn't selecting object correctly
  * Closed #57 by passing on object information into the documentation template (now `qData-doc.R`)
  * Adapted test template so that object name is passed forward

# qDatr 0.1.0

## Package

* Updated CONTRIBUTING
* Added README.Rmd render to pushrelease workflow

## Collection

* Closed #47 by adding `qtemplate()` function for finding and rendering templates
* Closed #44 by adding `create_qPackage()` that establishes a `{qData}` consistent package framework
  * Fixed #42 by drawing information from DESCRIPTION where possible
  * Added DESCRIPTION template
  * Added README template
  * Added COC template
  * Added CONTRIBUTING template
  * Added PR and issue templates for bugs and features
  * Added workflow templates for push-release, pr-checks, and pr-commands
* Closed #48 by adding `use_qData_raw()` for setting up data cleaning and wrangling
  * Added template for importing, cleaning and exporting raw data

## Correction

* Closed #24 by adding `repaint()` for filling in missing data by lookup
* Added `recent()` for sensible centuries for dates

## Connection

* Closed #45 by adding `use_qData()` for setting up tests, documentation, and lazy-loading of cleaned data
  * Added template for documenting cleaned data
  * Added template for testing cleaned data

# qDatr 0.0.4

## Collection

* Closed #25 by adding `create_qpackage()`
* Fixed 'pushrelease.yml' postfix bug

## Correction

* Closed #26 by adding `interleave()`
* Closed #23 by adding `resequence()`
* Closed #30 by adding `recollect()`

# qDatr 0.0.3

## Package

* Closed #18 by setting up `{lintr}`, `{goodpractice}`, and `{spelling}` in prchecks.yml

## Correction

* Closed #29 by adding `rearrange()` 
* Closed #31 by adding `reunite()`

# qDatr 0.0.2

## Package

* Added a `NEWS.md` file to track changes to the package.

## Correction

* Added `transmutate()` for merging variables

# qDatr 0.0.1

## Package

* Package set-up

## Correction

* Added `entitle()` for standardising treaty titles, etc.
