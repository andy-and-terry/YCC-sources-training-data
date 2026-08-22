from typing import Callable, List


class Subject:
    def __init__(self):
        self._observers: List[Callable] = []

    def subscribe(self, observer: Callable):
        self._observers.append(observer)

    def unsubscribe(self, observer: Callable):
        self._observers.remove(observer)

    def notify(self, *args, **kwargs):
        for observer in self._observers:
            observer(*args, **kwargs)


class TemperatureSensor(Subject):
    def __init__(self):
        super().__init__()
        self._temperature = 0.0

    def set_temperature(self, value: float):
        self._temperature = value
        self.notify(value)


if __name__ == "__main__":
    sensor = TemperatureSensor()
    sensor.subscribe(lambda t: print(f"Alert: temperature is now {t}"))
    sensor.set_temperature(25.5)
