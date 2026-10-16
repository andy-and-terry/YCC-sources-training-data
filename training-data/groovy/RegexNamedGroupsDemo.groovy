def log = '2024-03-15 ERROR [db] connection lost'
def m = log =~ /(?<date>\d{4}-\d{2}-\d{2}) (?<level>[A-Z]+) \[(?<mod>\w+)\] (?<msg>.*)/
if (m.matches()) {
    println m.group('date')
    println m.group('level')
    println m.group('mod')
    println m.group('msg')
}

def (all, y, mo, d) = (log =~ /(\d{4})-(\d{2})-(\d{2})/)[0]
println "$y/$mo/$d"

println 'a1b22c333'.findAll(/\d+/)
println 'a1b22c333'.replaceAll(/\d+/) { it.size() }
println ('x=1, y=2' =~ /(\w)=(\d)/).collect { it[1] + it[2] }
