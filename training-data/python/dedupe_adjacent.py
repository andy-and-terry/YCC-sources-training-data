# Remove consecutive duplicate items.
from itertools import groupby

def dedupe(seq):
    return [k for k, _ in groupby(seq)]

print("".join(dedupe("aabbbcdd")))
