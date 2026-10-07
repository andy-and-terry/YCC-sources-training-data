def words = ['pear', 'Fig', 'banana', 'apple', 'kiwi', 'Cherry']

println words.sort(false)
println words.sort(false, String.CASE_INSENSITIVE_ORDER)
println words.sort(false) { it.length() }
println words.sort(false) { a, b -> b.length() <=> a.length() ?: a <=> b }

def people = [
    [name: 'Ann', age: 30],
    [name: 'Bob', age: 25],
    [name: 'Cy',  age: 30]
]
def byAgeThenName = { a, b -> a.age <=> b.age ?: a.name <=> b.name } as Comparator
println people.sort(false, byAgeThenName)*.name
println people.sort(false, byAgeThenName.reversed())*.name

println people.toSorted { -it.age }*.name
println people.min { it.age }.name
println ([3, 1, 2].toSorted().reverse())
println ([[2, 'b'], [1, 'z'], [2, 'a']].sort { a, b -> a[0] <=> b[0] ?: a[1] <=> b[1] })
println words.groupBy { it.size() }.sort { -it.key }
