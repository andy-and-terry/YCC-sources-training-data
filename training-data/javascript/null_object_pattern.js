class Logger {
  log(message) {
    return `[LOG] ${message}`;
  }
}

class NullLogger {
  log() {
    return null;
  }
}

class Service {
  constructor(logger = new NullLogger()) {
    this.logger = logger;
  }

  run() {
    const results = [];
    results.push(this.logger.log('starting'));
    results.push('did work');
    results.push(this.logger.log('done'));
    return results.filter((r) => r !== null);
  }
}

const withLogging = new Service(new Logger());
const silent = new Service();

console.log(withLogging.run());
console.log(silent.run());

module.exports = { Logger, NullLogger, Service };
