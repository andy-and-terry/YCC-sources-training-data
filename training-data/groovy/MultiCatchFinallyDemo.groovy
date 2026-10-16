def risky(int n) {
    switch (n) {
        case 0: throw new IllegalArgumentException('zero')
        case 1: throw new NumberFormatException('one')
        case 2: return 10 / 0
        case 3: return [1][5].toString()
        default: return n
    }
}

(0..4).each { n ->
    try {
        println "ok: ${risky(n)}"
    } catch (IllegalArgumentException | ArithmeticException e) {
        println "multi: ${e.class.simpleName}"
    } catch (Exception e) {
        println "generic: ${e.message}"
    } finally {
        println "done $n"
    }
}
