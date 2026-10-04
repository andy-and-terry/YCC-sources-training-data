import java.text.SimpleDateFormat

def fmt = new SimpleDateFormat("yyyy-MM-dd")
fmt.timeZone = TimeZone.getTimeZone("UTC")

def d = fmt.parse("2024-02-27")
println fmt.format(d + 3)
println fmt.format(d - 30)

def later = fmt.parse("2024-03-15")
println (later - d)
println d.format("EEE, d MMM yyyy", TimeZone.getTimeZone("UTC"))
println (d < later)

def cal = Calendar.getInstance(TimeZone.getTimeZone("UTC"))
cal.time = d
println cal.get(Calendar.DAY_OF_YEAR)
println (1..3).collect { fmt.format(d + it) }
