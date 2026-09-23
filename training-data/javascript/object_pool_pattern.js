class Connection {
  constructor(id) {
    this.id = id;
    this.inUse = false;
  }
  query(sql) {
    return `conn#${this.id} -> ${sql}`;
  }
}

class ConnectionPool {
  constructor(size) {
    this.pool = Array.from({ length: size }, (_, i) => new Connection(i));
  }

  acquire() {
    const conn = this.pool.find((c) => !c.inUse);
    if (!conn) throw new Error('pool exhausted');
    conn.inUse = true;
    return conn;
  }

  release(conn) {
    conn.inUse = false;
  }

  get available() {
    return this.pool.filter((c) => !c.inUse).length;
  }
}

const pool = new ConnectionPool(2);
const a = pool.acquire();
const b = pool.acquire();
console.log(a.query('SELECT 1'));
console.log(b.query('SELECT 2'));
console.log('available:', pool.available);

pool.release(a);
console.log('available after release:', pool.available);
const c = pool.acquire();
console.log(c.query('SELECT 3'), 'reused id:', c.id === a.id);

module.exports = { Connection, ConnectionPool };
