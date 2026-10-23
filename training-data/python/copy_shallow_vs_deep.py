import copy

original = {"name": "cfg", "items": [1, 2, [3, 4]]}

alias = original
shallow = copy.copy(original)
deep = copy.deepcopy(original)

original["items"][2].append(5)
original["name"] = "changed"

print(alias["name"], alias["items"])
print(shallow["name"], shallow["items"])
print(deep["name"], deep["items"])


class Node:
    def __init__(self, value, parent=None):
        self.value = value
        self.parent = parent
        self.children = []

root = Node("root")
child = Node("child", root)
root.children.append(child)

clone = copy.deepcopy(root)
print(clone.children[0].parent is clone)
