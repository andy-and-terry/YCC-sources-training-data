def a = 3
def b = 4
assert a * a + b * b == 25
assert [1, 2, 3].contains(2)
assert 'abc'.size() == 3 : "size should be 3"

try {
    def list = [1, 2, 3]
    assert list.sum() == 7
} catch (AssertionError e) {
    println "caught assertion"
    println e.message.readLines().first()
}
