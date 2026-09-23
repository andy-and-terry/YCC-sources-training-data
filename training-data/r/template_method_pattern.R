DataMiner <- setRefClass("DataMiner",
  methods = list(
    mine = function(path) {
      # The template method fixes the algorithm's skeleton; each step
      # is overridden by a subclass.
      raw <- open_file(path)
      data <- extract_data(raw)
      analyze(data)
    },
    open_file = function(path) stop("not implemented"),
    extract_data = function(raw) stop("not implemented"),
    analyze = function(data) stop("not implemented")
  )
)

CsvMiner <- setRefClass("CsvMiner",
  contains = "DataMiner",
  methods = list(
    open_file = function(path) paste("csv contents of", path),
    extract_data = function(raw) strsplit(raw, " "),
    analyze = function(data) cat("CSV analysis of tokens:", length(data[[1]]), "\n")
  )
)

miner <- CsvMiner$new()
miner$mine("report.csv")
