class ListNode:
    def __init__(self, val, nxt=None):
        self.val, self.next = val, nxt


def from_list(xs):
    head = None
    for x in reversed(xs):
        head = ListNode(x, head)
    return head


def to_list(node):
    out = []
    while node:
        out.append(node.val)
        node = node.next
    return out


def merge(a, b):
    dummy = tail = ListNode(0)
    while a and b:
        if a.val <= b.val:
            tail.next, a = a, a.next
        else:
            tail.next, b = b, b.next
        tail = tail.next
    tail.next = a or b
    return dummy.next


if __name__ == "__main__":
    print(to_list(merge(from_list([1, 2, 4, 9]), from_list([1, 3, 4, 5, 10]))))
