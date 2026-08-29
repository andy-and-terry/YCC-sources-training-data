proc is_leap_year {year} {
    return [expr {($year % 4 == 0 && $year % 100 != 0) || $year % 400 == 0}]
}

puts [is_leap_year 2000]
puts [is_leap_year 1900]
puts [is_leap_year 2024]
