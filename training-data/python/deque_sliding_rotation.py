from collections import deque

d = deque(range(6))
d.rotate(2)
print(d)
d.rotate(-3)
print(d)

d.appendleft(-1)
d.extend([10, 11])
print(d.popleft(), d.pop(), list(d))

recent = deque(maxlen=3)
for i in range(7):
    recent.append(i)
print(recent)
