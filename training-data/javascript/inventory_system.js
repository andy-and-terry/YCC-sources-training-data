class Inventory {
  #products = new Map();

  addProduct(sku, price, reorderLevel = 5) {
    this.#products.set(sku, { price, reorderLevel, qty: 0 });
  }
  receive(sku, qty) {
    const p = this.#products.get(sku);
    if (!p) throw new Error(`unknown sku ${sku}`);
    p.qty += qty;
  }
  sell(sku, qty) {
    const p = this.#products.get(sku);
    if (!p || p.qty < qty) throw new Error(`only ${p?.qty ?? 0} of ${sku} left`);
    p.qty -= qty;
    return qty * p.price;
  }
  lowStock() {
    return [...this.#products].filter(([, p]) => p.qty <= p.reorderLevel).map(([sku]) => sku);
  }
  valuation() {
    return [...this.#products.values()].reduce((s, p) => s + p.qty * p.price, 0);
  }
}

const inv = new Inventory();
inv.addProduct("apple", 0.5, 10);
inv.addProduct("pear", 0.75);
inv.receive("apple", 40);
inv.receive("pear", 8);
const revenue = inv.sell("apple", 32) + inv.sell("pear", 2);
console.log(`revenue=${revenue.toFixed(2)} value=${inv.valuation().toFixed(2)} low=${inv.lowStock()}`);
module.exports = { Inventory };
