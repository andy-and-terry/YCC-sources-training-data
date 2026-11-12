import groovy.transform.*
@ToString @EqualsAndHashCode
class P { String n; int a }
def p = new P(n: 'x', a: 1)
println p
println p == new P(n: 'x', a: 1)
