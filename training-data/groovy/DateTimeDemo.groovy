import java.time.LocalDate
import java.time.format.DateTimeFormatter

def d = LocalDate.of(2024, 2, 28)
println d + 2
println d - 30
println d.plusMonths(1).format(DateTimeFormatter.ISO_DATE)
println d.dayOfWeek
println (d..(d + 3)).collect { it.toString() }

def date = new Date(0)
println date.format('yyyy-MM-dd', TimeZone.getTimeZone('UTC'))
def parsed = Date.parse('yyyy-MM-dd', '2020-01-15')
println parsed.format('MMM d, yyyy')
println (Date.parse('yyyy-MM-dd', '2020-01-20') - parsed)
