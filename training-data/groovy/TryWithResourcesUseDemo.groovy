def tmp = File.createTempFile('demo', '.txt')
tmp.text = "line1\nline2\n"

tmp.withReader { r ->
    println r.readLine()
}

tmp.withWriterAppend { w ->
    w.println 'line3'
}

tmp.eachLine { line, no -> println "$no: $line" }

new StringWriter().with { sw ->
    sw.withPrintWriter { it.println 'in memory' }
    println sw.toString().trim()
}
tmp.delete()
println tmp.exists()
