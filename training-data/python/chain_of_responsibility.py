from abc import ABC, abstractmethod


class Handler(ABC):
    def __init__(self):
        self._next = None

    def set_next(self, handler):
        self._next = handler
        return handler

    def handle(self, amount):
        parts = []
        self._dispense(amount, parts)
        if amount != 0 and not parts:
            raise ValueError("cannot dispense this amount exactly")
        return parts

    @abstractmethod
    def _dispense(self, amount, parts):
        ...


class BillDispenser(Handler):
    def __init__(self, denomination):
        super().__init__()
        self.denomination = denomination

    def _dispense(self, amount, parts):
        count, remainder = divmod(amount, self.denomination)
        if count:
            parts.append(f"{count}x${self.denomination}")
        if remainder and self._next:
            self._next._dispense(remainder, parts)
        elif remainder:
            raise ValueError(f"leftover {remainder} with no smaller handler")


if __name__ == "__main__":
    hundred = BillDispenser(100)
    fifty = BillDispenser(50)
    twenty = BillDispenser(20)
    hundred.set_next(fifty).set_next(twenty)

    print(hundred.handle(270))
