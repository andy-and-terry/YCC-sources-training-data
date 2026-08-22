class Node:
    def __init__(self, value, next=None):
        self.value = value
        self.next = next


def reverse(head):
    prev = None
    current = head
    while current:
        next_node = current.next
        current.next = prev
        prev = current
        current = next_node
    return prev


def to_list(head):
    result = []
    while head:
        result.append(head.value)
        head = head.next
    return result


if __name__ == "__main__":
    head = Node(1, Node(2, Node(3, Node(4))))
    print(to_list(reverse(head)))
