import groovy.transform.Canonical

@Canonical
class Leaf { int value }

@Canonical
class Node {
    Object left
    Object right
}

@Newify([Leaf, Node])
def buildTree() {
    Node(Node(Leaf(1), Leaf(2)), Leaf(3))
}

def sumTree(t) {
    t instanceof Leaf ? t.value : sumTree(t.left) + sumTree(t.right)
}

def tree = buildTree()
println tree
println sumTree(tree)
