def orig = [1, 2, 3]
def ro = orig.asImmutable()
try { ro << 4 } catch (UnsupportedOperationException e) { println 'read only view' }
orig << 4
println ro

def sync = Collections.synchronizedList([])
5.times { sync << it }
println sync

def lazy = (1..Integer.MAX_VALUE).iterator()
println lazy.take(3).toList()

def it2 = [1, 2, 3].iterator()
println it2.next()
println it2.hasNext()
println it2.collect { it * 10 }
println [1, 2, 3].listIterator(1).next()
