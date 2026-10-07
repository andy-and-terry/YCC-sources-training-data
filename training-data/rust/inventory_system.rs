use std::collections::BTreeMap;
use std::fmt;

#[derive(Debug)]
enum InventoryError {
    UnknownSku(String),
    Insufficient { sku: String, have: u32, want: u32 },
}

impl fmt::Display for InventoryError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match self {
            InventoryError::UnknownSku(s) => write!(f, "unknown sku {}", s),
            InventoryError::Insufficient { sku, have, want } => write!(f, "{}: have {}, want {}", sku, have, want),
        }
    }
}

struct Product {
    name: String,
    price_cents: u64,
    reorder_level: u32,
    qty: u32,
}

#[derive(Default)]
struct Inventory(BTreeMap<String, Product>);

impl Inventory {
    fn add(&mut self, sku: &str, name: &str, price_cents: u64, reorder_level: u32) {
        self.0.insert(sku.into(), Product { name: name.into(), price_cents, reorder_level, qty: 0 });
    }

    fn get(&mut self, sku: &str) -> Result<&mut Product, InventoryError> {
        self.0.get_mut(sku).ok_or_else(|| InventoryError::UnknownSku(sku.into()))
    }

    fn receive(&mut self, sku: &str, qty: u32) -> Result<(), InventoryError> {
        self.get(sku)?.qty += qty;
        Ok(())
    }

    fn sell(&mut self, sku: &str, qty: u32) -> Result<u64, InventoryError> {
        let p = self.get(sku)?;
        if p.qty < qty {
            return Err(InventoryError::Insufficient { sku: sku.into(), have: p.qty, want: qty });
        }
        p.qty -= qty;
        Ok(qty as u64 * p.price_cents)
    }

    fn reorder_list(&self) -> Vec<&str> {
        self.0.values().filter(|p| p.qty <= p.reorder_level).map(|p| p.name.as_str()).collect()
    }
}

fn main() -> Result<(), InventoryError> {
    let mut inv = Inventory::default();
    inv.add("A1", "apple", 50, 10);
    inv.add("P1", "pear", 75, 5);
    inv.receive("A1", 40)?;
    inv.receive("P1", 8)?;
    let revenue = inv.sell("A1", 32)? + inv.sell("P1", 2)?;
    println!("revenue {}.{:02}", revenue / 100, revenue % 100);
    if let Err(e) = inv.sell("P1", 100) {
        println!("error: {}", e);
    }
    if let Err(e) = inv.receive("X9", 1) {
        println!("error: {}", e);
    }
    println!("reorder: {:?}", inv.reorder_list());
    Ok(())
}
