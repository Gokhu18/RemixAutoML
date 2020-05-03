#' FakeDataGenerator
#' 
#' @author Adrian Antico
#' @family Data Wrangling
#' @param N Number of records
#' @param ID Number of IDcols to include
#' @param ZIP Parameter for zero inflated data generation
#' @param AddDate Set to TRUE to include a date column
#' @export
FakeDataGenerator <- function(N = 1000, ID = 1, ZIP = 1, AddDate = FALSE) {
  
  # Create data----
  Correl <- 0.85
  data <- data.table::data.table(Adrian = runif(N))
  data[, x1 := qnorm(Adrian)]
  data[, x2 := runif(N)]
  data[, Independent_Variable1 := log(pnorm(Correl * x1 + sqrt(1-Correl^2) * qnorm(x2)))]
  data[, Independent_Variable2 := (pnorm(Correl * x1 + sqrt(1-Correl^2) * qnorm(x2)))]
  data[, Independent_Variable3 := exp(pnorm(Correl * x1 + sqrt(1-Correl^2) * qnorm(x2)))]
  data[, Independent_Variable4 := exp(exp(pnorm(Correl * x1 + sqrt(1-Correl^2) * qnorm(x2))))]
  data[, Independent_Variable5 := sqrt(pnorm(Correl * x1 + sqrt(1-Correl^2) * qnorm(x2)))]
  data[, Independent_Variable6 := (pnorm(Correl * x1 + sqrt(1-Correl^2) * qnorm(x2)))^0.10]
  data[, Independent_Variable7 := (pnorm(Correl * x1 + sqrt(1-Correl^2) * qnorm(x2)))^0.25]
  data[, Independent_Variable8 := (pnorm(Correl * x1 + sqrt(1-Correl^2) * qnorm(x2)))^0.75]
  data[, Independent_Variable9 := (pnorm(Correl * x1 + sqrt(1-Correl^2) * qnorm(x2)))^2]
  data[, Independent_Variable10 := (pnorm(Correl * x1 + sqrt(1-Correl^2) * qnorm(x2)))^4]
  data[, Independent_Variable11 := as.factor(
    data.table::fifelse(Independent_Variable2 < 0.20, "A",
                        data.table::fifelse(Independent_Variable2 < 0.40, "B",
                                            data.table::fifelse(Independent_Variable2 < 0.6,  "C",
                                                                data.table::fifelse(Independent_Variable2 < 0.8,  "D", "E")))))]
  
  # Add date----
  if(AddDate) {
    data <- data[, DateTime := as.Date(Sys.time())]
    data[, temp := 1:.N][, DateTime := DateTime - temp][, temp := NULL]
    data <- data[order(DateTime)]
  }
  
  # IDcols----
  if(ID == 1) data[, ':=' (x1 = NULL)] else if(ID == 0) data[, ':=' (x1 = NULL, x2 = NULL)]
  
  # ZIP setup----
  if(ZIP == 1) data[, Adrian := ifelse(Adrian < 0.5, 0, log(Adrian*10))] else if (ZIP == 2) data[, Adrian := ifelse(Adrian < 0.35, 0, ifelse(Adrian < 0.65, log(Adrian*10), log(Adrian*20)))]
  
  # Return data----
  return(data)
}