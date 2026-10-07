from collections import Counter, deque

text = "the quick brown fox jumps over the lazy dog the end"
counts = Counter(text.split())
print(counts.most_common(2))
print(counts + Counter(the=2), counts - Counter(the=5))

window = deque(maxlen=3)
for n in range(6):
    window.append(n)
    print(list(window), sum(window) / len(window))

d = deque([1, 2, 3, 4, 5])
d.rotate(2)
print(d)
d.appendleft(0)
print(d.popleft(), d.pop())
