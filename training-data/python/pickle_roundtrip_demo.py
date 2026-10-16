import pickle
import copy
from dataclasses import dataclass


@dataclass
class Point:
    x: int
    y: int


obj = {"pts": [Point(1, 2), Point(3, 4)], "set": {1, 2}, "t": (1, "a")}
blob = pickle.dumps(obj)
print(type(blob), len(blob) > 10)
back = pickle.loads(blob)
print(back == obj, back is obj)


class Conn:
    def __init__(self):
        self.handle = object()
        self.url = "db://x"

    def __getstate__(self):
        return {"url": self.url}

    def __setstate__(self, state):
        self.url = state["url"]
        self.handle = object()


c = pickle.loads(pickle.dumps(Conn()))
print(c.url, copy.deepcopy(obj) == obj)
