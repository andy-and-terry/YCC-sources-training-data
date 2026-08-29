is_leap_year <- function(year) {
  (year %% 4 == 0 && year %% 100 != 0) || year %% 400 == 0
}

print(is_leap_year(2000))
print(is_leap_year(1900))
print(is_leap_year(2024))
