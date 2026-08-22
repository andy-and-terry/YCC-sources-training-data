class DNode:
    def __init__(self, value):
        self.value = value
        self.prev = None
        self.next = None


class DoublyLinkedList:
    def __init__(self):
        self.head = None
        self.tail = None

    def append(self, value):
        node = DNode(value)
        if not self.head:
            self.head = self.tail = node
            return
        node.prev = self.tail
        self.tail.next = node
        self.tail = node

    def remove(self, value):
        node = self.head
        while node:
            if node.value == value:
                if node.prev:
                    node.prev.next = node.next
                else:
                    self.head = node.next
                if node.next:
                    node.next.prev = node.prev
                else:
                    self.tail = node.prev
                return True
            node = node.next
        return False

    def to_list(self):
        result = []
        node = self.head
        while node:
            result.append(node.value)
            node = node.next
        return result


if __name__ == "__main__":
    dll = DoublyLinkedList()
    for v in [1, 2, 3, 4]:
        dll.append(v)
    dll.remove(3)
    print(dll.to_list())
