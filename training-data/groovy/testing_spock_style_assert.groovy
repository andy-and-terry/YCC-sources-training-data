def add(a, b) { a + b }
assert add(1, 2) == 3
def result = shouldFail { add(null, 1) }
println result.class.simpleName
def shouldFail(Closure c) { try { c(); null } catch (Throwable t) { t } }
def table = [[1, 2, 3], [2, 3, 5], [10, -5, 5]]
table.each { a, b, expected -> assert add(a, b) == expected : "add($a, $b)" }
println 'table ok'
try { assert 1 == 2 : 'custom message' } catch (AssertionError e) { println e.message.split('\n')[0] }
def mock = [call: { it * 2 }]
assert mock.call(4) == 8
def spy = []
def logger = { spy << it }
logger('a'); logger('b')
assert spy == ['a', 'b']
def stub = [val: 1] as Expando
println stub.val
interface Svc { int get(int x) }
def svc = { x -> x + 100 } as Svc
assert svc.get(1) == 101
println 'done'
assert [1, 2, 3].containsAll([1, 2])
assert 'abc'.contains('b') && !'abc'.contains('z')
assert 0.1G + 0.2G == 0.3G
println [3, 1, 2].sort() == [1, 2, 3]
