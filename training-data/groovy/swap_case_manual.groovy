def swapCase = { String s -> s.collect { it.isUpperCase() ? it.toLowerCase() : it.toUpperCase() }.join() }
println swapCase("Hello World 42")
