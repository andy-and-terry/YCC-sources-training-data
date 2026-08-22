type Observer<T> = (value: T) => void;

class Subject<T> {
  private observers: Observer<T>[] = [];

  subscribe(observer: Observer<T>): void {
    this.observers.push(observer);
  }

  unsubscribe(observer: Observer<T>): void {
    this.observers = this.observers.filter((o) => o !== observer);
  }

  notify(value: T): void {
    for (const observer of this.observers) observer(value);
  }
}

class TemperatureSensor extends Subject<number> {
  setTemperature(value: number): void {
    this.notify(value);
  }
}

const sensor = new TemperatureSensor();
sensor.subscribe((t) => console.log(`Alert: temperature is now ${t}`));
sensor.setTemperature(25.5);
