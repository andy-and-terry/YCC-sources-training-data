trait Counter {
    int count = 0
    void inc() { count++ }
    abstract String label()
    String report() { "${label()}: $count" }
}

trait Loud {
    String shout(String s) { s.toUpperCase() + '!' }
}

class Clicker implements Counter, Loud {
    String label() { 'clicks' }
}

def c = new Clicker()
3.times { c.inc() }
println c.report()
println c.shout('done')
println c instanceof Counter

def anon = new Object() as Loud
println anon.shout('proxy')
