class ConnectionPool {
  static #instanceCount = 0;
  static maxConnections: number;

  static {
    ConnectionPool.maxConnections = 10;
  }

  readonly id: number;

  constructor() {
    if (ConnectionPool.#instanceCount >= ConnectionPool.maxConnections) {
      throw new Error('connection pool exhausted');
    }
    ConnectionPool.#instanceCount += 1;
    this.id = ConnectionPool.#instanceCount;
  }

  static get activeConnections(): number {
    return ConnectionPool.#instanceCount;
  }

  static reset(): void {
    ConnectionPool.#instanceCount = 0;
  }
}

const first = new ConnectionPool();
const second = new ConnectionPool();
console.log(first.id, second.id);
console.log(ConnectionPool.activeConnections);
console.log(ConnectionPool.maxConnections);
