from itertools import islice

def batched(iterable, n):
    it = iter(iterable)
    while chunk := tuple(islice(it, n)):
        yield chunk

print(list(batched(range(7), 3)))
