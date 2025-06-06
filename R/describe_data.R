#' Data reports for datacubes and datasets with 'mdate' variables
#' @description
#'   These functions provide meta level descriptions of datacubes or datasets.
#'   `mreport()` creates a properly formatted data report for datasets which contain 'mdate'
#'   class objects, alongside other object classes.
#'   `describe_datacube()` prints a text description of the datasets in a
#'   datacube.
#' @param data A `{tibble}` or a `{data.frame}`.
#' @return A data report of class 'mreport'.
#' @importFrom dplyr %>%
#' @importFrom stats na.omit
#' @details 'mreport' displays the variable's name,
#'   the variable type, the number of observations per variable,
#'   the number of missing observations for variable,
#'   and the percentage of missing observations in variable.
#' @name describe
NULL

#' @rdname describe
#' @examples
#' mreport(emperors)
#' @export
mreport <- function(data) UseMethod("mreport")

#' @export
mreport.default <- function(data) {
  if (!is.data.frame(data)) {
    stop("Data must be a `data.frame` or `tibble`.")
  }
  rows     <- nrow(data)
  cols     <- ncol(data)
  varnames <- names(data)
  datatype <- unlist(lapply(data, class))
  counts   <- unlist(lapply(data, length))
  mvalues    <- unlist(lapply(data, function(z) sum(is.na(z))))
  mvaluesper <- round((mvalues / counts) * 100, 2)
  counts <- counts - mvalues
  result <- list(Rows          = rows,
                 Columns       = cols,
                 Variables     = varnames,
                 Types         = datatype,
                 Count         = counts,
                 Missing       = mvalues,
                 MissingPer    = mvaluesper)
  class(result) <- "mreport"
  return(result)
}

#' @export
mreport.list <- function(data) {
  lapply(data, mreport)
}

#' @export
print.mreport <- function(x, ...) {
  columns <- c("  Variable  ", "  Class  ", "  Obs  ",
               "  Missing  ", "  Miss %  ")
  len_col <- as.vector(unlist(lapply(columns, nchar)))
  x$Types <- lapply(x$Types, paste, collapse = ", ")
  lengths <- list(x$Variables, x$Types, x$Count, x$Missing, x$MissingPer)
  n <- length(columns)
  nlist <- list()
  for (i in seq_len(n)) {
    nlist[[i]] <- max(len_col[i], max(unlist(lapply(lengths[[i]], nchar))))
  }
  clengths <- unlist(nlist)
  dash <- sum(clengths) + 6
  cat(rep("-", dash), sep = "")
  cat("\n|")
  for (i in seq_len(n)) {
    cat(format(columns[i], width = clengths[i], justify = "centre"),
        "|", sep = "")
  }
  cat("\n", rep("-", dash), sep = "")
  cat("\n")
  for (i in seq_len(x$Columns)) {
    cat("|", format(x$Variables[i], width = clengths[1], justify = "left"), "|",
        format(x$Types[i], width = clengths[2], justify = "left"), "|",
        format(x$Count[i], width = clengths[3], justify = "right"), "|",
        format(as.character(x$Missing[i]), width = clengths[4], justify = "right"), "|",
        format(as.character(x$MissingPer[i]), width = clengths[5], justify = "right"),
        "|\n", sep = "")
  }
  cat(rep("-", dash), sep = "")
  cat("\n\n")
}

#' @rdname describe
#' @param datacube A datacube
#' @export
describe_datacube <- function(datacube){
  paste0("The `", deparse(substitute(datacube)), 
         "` datacube is a list containing ", length(datacube),
         " datasets: ", cli::pluralize("{names(datacube)}"))
}

