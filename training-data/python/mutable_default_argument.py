def bad_append(x, bucket=[]):
    bucket.append(x)
    return bucket


print(bad_append(1))
print(bad_append(2))  # surprise: [1, 2]


def good_append(x, bucket=None):
    if bucket is None:
        bucket = []
    bucket.append(x)
    return bucket


print(good_append(1))
print(good_append(2))
print(bad_append.__defaults__)
