class Subject {
  #observers = [];

  subscribe(observer) {
    this.#observers.push(observer);
  }

  unsubscribe(observer) {
    this.#observers = this.#observers.filter((o) => o !== observer);
  }

  notify(...args) {
    for (const observer of this.#observers) observer(...args);
  }
}

class TemperatureSensor extends Subject {
  setTemperature(value) {
    this.notify(value);
  }
}

const sensor = new TemperatureSensor();
sensor.subscribe((t) => console.log(`Alert: temperature is now ${t}`));
sensor.setTemperature(25.5);
module.exports = { Subject, TemperatureSensor };
