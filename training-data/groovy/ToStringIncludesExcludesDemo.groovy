import groovy.transform.*

@ToString(includeNames = true, excludes = 'password')
@EqualsAndHashCode(excludes = 'password')
class Account {
    String user
    String password
    int balance
}

@ToString(includePackage = false, includeSuper = true)
class Savings extends Account {
    double rate
}

def a = new Account(user: 'ann', password: 'x', balance: 5)
def b = new Account(user: 'ann', password: 'y', balance: 5)
println a
println a == b
println a.hashCode() == b.hashCode()
println new Savings(user: 'bo', rate: 0.02)
