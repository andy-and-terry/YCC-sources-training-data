class Report {
  constructor(rows) {
    this.rows = rows;
  }

  get total() {
    console.log("computing total");
    const value = this.rows.reduce((a, b) => a + b, 0);
    Object.defineProperty(this, "total", { value, enumerable: true });
    return value;
  }
}

const r = new Report([1, 2, 3, 4]);
console.log(r.total);
console.log(r.total);
console.log(Object.keys(r));
console.log(Object.getOwnPropertyDescriptor(r, "total").writable);
