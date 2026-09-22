describe_day <- function(day) {
  switch(day,
    Mon = ,
    Tue = ,
    Wed = ,
    Thu = ,
    Fri = "weekday",
    Sat = ,
    Sun = "weekend",
    "unknown day"
  )
}

quarter_name <- function(q) {
  switch(q,
    "Q1: Jan-Mar",
    "Q2: Apr-Jun",
    "Q3: Jul-Sep",
    "Q4: Oct-Dec"
  )
}

for (d in c("Mon", "Sat", "Xyz")) {
  cat(d, "->", describe_day(d), "\n")
}

for (q in 1:4) {
  cat(q, "->", quarter_name(q), "\n")
}
