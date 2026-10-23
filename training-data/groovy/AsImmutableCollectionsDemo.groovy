// Making read-only views and copies of collections
def names = ['ann', 'bob']

def view = names.asUnmodifiable()
def copy = names.asImmutable()

names << 'cid'
println "source: $names"
println "view sees change: $view"     // read-only view of the original
println "immutable: $copy"

try {
    view << 'dee'
} catch (UnsupportedOperationException e) {
    println "view is read-only"
}

def config = [host: 'localhost', port: 8080].asImmutable()
try {
    config.port = 9090
} catch (UnsupportedOperationException e) {
    println "map is read-only"
}
println config

// Collections helpers do the same
def frozen = Collections.unmodifiableList([1, 2, 3])
println frozen.sum()
println frozen.getClass().simpleName
