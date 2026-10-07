proc runReport {fetchDataProc formatProc title} {
    set data [$fetchDataProc]
    set formatted [$formatProc $data]
    puts "=== $title ==="
    puts $formatted
}

proc fetchSalesData {} {
    return {100 250 175}
}

proc formatAsTotal {data} {
    set total 0
    foreach v $data { incr total $v }
    return "Total: $total"
}

proc formatAsList {data} {
    return "Items: [join $data ", "]"
}

runReport fetchSalesData formatAsTotal "Sales Total"
runReport fetchSalesData formatAsList "Sales Items"
