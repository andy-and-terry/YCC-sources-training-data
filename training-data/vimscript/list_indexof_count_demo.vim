let items = [3, 1, 4, 1, 5, 9, 1]

echo index(items, 1)
echo index(items, 1, 2)
echo index(items, 42)
echo count(items, 1)

let people = [{'name': 'ann', 'age': 31}, {'name': 'bob', 'age': 25}]
echo indexof(people, {_, v -> v.age < 30})
echo indexof(people, {_, v -> v.name ==# 'zed'})
echo count(['a', 'A', 'a'], 'a', 1)
echo max(items) . ' ' . min(items)
