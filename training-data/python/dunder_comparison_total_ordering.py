from functools import total_ordering


@total_ordering
class Money:
    def __init__(self, cents):
        self.cents = cents

    def __eq__(self, o):
        return self.cents == o.cents

    def __lt__(self, o):
        return self.cents < o.cents


if __name__ == "__main__":
    print(Money(5) <= Money(7), Money(9) > Money(2))
