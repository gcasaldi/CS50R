# Creiamo la cartella man/ se non esiste
if (!dir.exists("man")) dir.create("man")

# Creiamo i file di documentazione .Rd
writeLines(c(
  "\name{sales_analysis}",
  "\alias{sales_analysis}",
  "\title{Analisi delle vendite}",
  "\description{Genera dati di vendita casuali e li analizza.}",
  "\usage{sales_analysis()}",
  "\arguments{}",
  "\value{Restituisce un dataframe con le vendite generate.}",
  "\examples{sales_data <- sales_analysis()}",
  ""
), "man/sales_analysis.Rd")

writeLines(c(
  "\name{total_sales}",
  "\alias{total_sales}",
  "\title{Vendite totali per prodotto}",
  "\description{Aggrega le vendite totali per prodotto.}",
  "\usage{total_sales(sales_data)}",
  "\arguments{\item{sales_data}{Dataframe con le vendite}}
  ",
  "\value{Restituisce un dataframe con le vendite aggregate.}",
  "\examples{total_sales(sales_data)}",
  ""
), "man/total_sales.Rd")

writeLines(c(
  "\name{plot_sales}",
  "\alias{plot_sales}",
  "\title{Grafico delle vendite}",
  "\description{Crea un grafico delle vendite totali per prodotto.}",
  "\usage{plot_sales(total_sales)}",
  "\arguments{\item{total_sales}{Dataframe con le vendite aggregate}}
  ",
  "\value{Nessun valore restituito, crea solo il grafico.}",
  "\examples{plot_sales(total_sales(sales_data))}",
  ""
), "man/plot_sales.Rd")

# Creiamo la cartella tests/ se non esiste
if (!dir.exists("tests")) dir.create("tests")

# Creiamo i file di test ben strutturati
writeLines(c(
  "library(testthat)",
  "source('R/sales_analysis.R')",
  "",
  "test_that('sales_data has correct structure', {",
  "  sales_data <- sales_analysis()",
  "  expect_true(is.data.frame(sales_data))",
  "  expect_true(all(c('ID', 'Product', 'Sales', 'Date') %in% colnames(sales_data)))",
  "  expect_type(sales_data$Sales, 'double')",
  "  expect_s3_class(sales_data$Date, 'Date')",
  "})",
  "",
  "test_that('total_sales calculates correctly', {",
  "  sales_data <- sales_analysis()",
  "  result <- total_sales(sales_data)",
  "  expect_true(is.data.frame(result))",
  "  expect_true('Sales' %in% colnames(result))",
  "  expect_true('Product' %in% colnames(result))",
  "  expect_true(all(result$Sales >= 0))",
  "})",
  "",
  "test_that('plot_sales runs without error', {",
  "  sales_data <- sales_analysis()",
  "  aggregated <- total_sales(sales_data)",
  "  expect_silent(plot_sales(aggregated))",
  "})",
  ""
), "tests/test_sales_analysis.R")
