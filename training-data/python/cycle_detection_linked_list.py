class Node:
    def __init__(self, val):
        self.val = val
        self.next = None


def find_cycle_start(head):
    slow = fast = head
    while fast and fast.next:
        slow, fast = slow.next, fast.next.next
        if slow is fast:
            slow = head
            while slow is not fast:
                slow, fast = slow.next, fast.next
            return slow
    return None


def build(values, loop_to=None):
    nodes = [Node(v) for v in values]
    for a, b in zip(nodes, nodes[1:]):
        a.next = b
    if loop_to is not None:
        nodes[-1].next = nodes[loop_to]
    return nodes[0]


if __name__ == "__main__":
    print(find_cycle_start(build([3, 2, 0, -4], loop_to=1)).val)
    print(find_cycle_start(build([1, 2, 3])))
