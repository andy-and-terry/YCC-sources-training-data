# Adapter: wrap a legacy interface so it satisfies the interface new
# client code expects, without touching the legacy implementation.

legacy_printer <- function() {
  list(print_inches = function(value) cat("legacy:", value, "inches\n"))
}

metric_adapter <- function(legacy) {
  list(print_cm = function(value_cm) legacy$print_inches(value_cm / 2.54))
}

printer <- metric_adapter(legacy_printer())
printer$print_cm(25.4)
printer$print_cm(5.08)
