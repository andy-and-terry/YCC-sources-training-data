class EuropeanSocket:
    def voltage(self):
        return 230


class USPlug:
    """The interface our client code expects."""

    def voltage(self):
        raise NotImplementedError


class EuropeanToUSAdapter(USPlug):
    def __init__(self, european_socket):
        self._socket = european_socket

    def voltage(self):
        # Pretend a step-down transformer converts 230V to 120V.
        return self._socket.voltage() / 230 * 120


def power_device(plug: USPlug):
    print(f"Device receives {plug.voltage():.0f}V")


if __name__ == "__main__":
    socket = EuropeanSocket()
    adapter = EuropeanToUSAdapter(socket)
    power_device(adapter)
