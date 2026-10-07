use std::sync::{Arc, Mutex};
use std::thread;

#[derive(Debug)]
enum TransferError {
    SameAccount,
    Insufficient { have: i64, need: i64 },
}

struct Bank {
    accounts: Vec<Mutex<i64>>,
}

impl Bank {
    /// Locks in index order to rule out deadlock between opposite transfers.
    fn transfer(&self, from: usize, to: usize, amount: i64) -> Result<(), TransferError> {
        if from == to {
            return Err(TransferError::SameAccount);
        }
        let (first, second) = if from < to { (from, to) } else { (to, from) };
        let mut a = self.accounts[first].lock().unwrap();
        let mut b = self.accounts[second].lock().unwrap();
        let (src, dst) = if from < to { (&mut *a, &mut *b) } else { (&mut *b, &mut *a) };
        if *src < amount {
            return Err(TransferError::Insufficient { have: *src, need: amount });
        }
        *src -= amount;
        *dst += amount;
        Ok(())
    }
}

fn main() {
    let bank = Arc::new(Bank { accounts: (0..5).map(|_| Mutex::new(1000)).collect() });
    let handles: Vec<_> = (0..8u64)
        .map(|t| {
            let bank = Arc::clone(&bank);
            thread::spawn(move || {
                let mut seed = t + 1;
                let mut rejected = 0;
                for _ in 0..20000 {
                    seed = seed.wrapping_mul(6364136223846793005).wrapping_add(1442695040888963407);
                    let (from, to, amt) = ((seed >> 20) as usize % 5, (seed >> 40) as usize % 5, (seed >> 50) as i64 % 100);
                    if let Err(TransferError::Insufficient { have, need }) = bank.transfer(from, to, amt) {
                        assert!(have < need);
                        rejected += 1;
                    }
                }
                rejected
            })
        })
        .collect();
    let rejected: u32 = handles.into_iter().map(|h| h.join().unwrap()).sum();
    let total: i64 = bank.accounts.iter().map(|m| *m.lock().unwrap()).sum();
    println!("total {} (expected 5000), rejected {}", total, rejected);
    println!("{:?}", bank.transfer(0, 0, 1));
}
