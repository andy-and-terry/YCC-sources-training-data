class Report {
    @Lazy List<String> rows = loadRows()
    @Lazy(soft = true) String heavy = buildHeavy()

    List<String> loadRows() {
        println 'loading rows...'
        ['r1', 'r2', 'r3']
    }

    String buildHeavy() {
        println 'building heavy...'
        'X' * 5
    }
}

def r = new Report()
println 'created'
println r.rows
println r.rows
println r.heavy
