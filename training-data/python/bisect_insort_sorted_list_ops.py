import bisect

xs = [10, 20, 30, 40]
bisect.insort(xs, 25)
print(xs, bisect.bisect_left(xs, 30), bisect.bisect_right(xs, 30))
