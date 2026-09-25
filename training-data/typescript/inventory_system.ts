interface Product { sku: string; name: string; price: number; reorderLevel: number }
type Movement = { sku: string; qty: number; reason: "receive" | "sale" | "adjust"; at: number };

export class Inventory {
  private products = new Map<string, Product>();
  private ledger: Movement[] = [];
  private clock = 0;

  register(p: Product): void {
    this.products.set(p.sku, p);
  }

  private record(sku: string, qty: number, reason: Movement["reason"]): void {
    if (!this.products.has(sku)) throw new Error(`unknown sku ${sku}`);
    if (this.onHand(sku) + qty < 0) throw new Error(`insufficient stock for ${sku}`);
    this.ledger.push({ sku, qty, reason, at: ++this.clock });
  }

  receive(sku: string, qty: number): void { this.record(sku, qty, "receive"); }
  sell(sku: string, qty: number): number {
    this.record(sku, -qty, "sale");
    return qty * this.products.get(sku)!.price;
  }
  adjust(sku: string, delta: number): void { this.record(sku, delta, "adjust"); }

  onHand(sku: string): number {
    return this.ledger.filter((m) => m.sku === sku).reduce((s, m) => s + m.qty, 0);
  }

  reorderList(): string[] {
    return [...this.products.values()].filter((p) => this.onHand(p.sku) <= p.reorderLevel).map((p) => p.name);
  }
}

const inv = new Inventory();
inv.register({ sku: "A1", name: "apple", price: 0.5, reorderLevel: 10 });
inv.register({ sku: "P1", name: "pear", price: 0.75, reorderLevel: 5 });
inv.receive("A1", 40);
inv.receive("P1", 8);
const revenue = inv.sell("A1", 32) + inv.sell("P1", 2);
inv.adjust("P1", -1); // damaged
console.log({ revenue, apples: inv.onHand("A1"), pears: inv.onHand("P1"), reorder: inv.reorderList() });
