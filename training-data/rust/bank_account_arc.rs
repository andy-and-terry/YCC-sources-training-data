use std::sync::{Arc, Mutex};
use std::thread;

#[derive(Debug)]
enum BankError {
    Insufficient { requested: u64, available: u64 },
}

#[derive(Default)]
struct Account {
    balance: Mutex<u64>,
}

impl Account {
    fn deposit(&self, n: u64) {
        *self.balance.lock().unwrap() += n;
    }
    fn withdraw(&self, n: u64) -> Result<(), BankError> {
        let mut b = self.balance.lock().unwrap();
        if n > *b {
            return Err(BankError::Insufficient { requested: n, available: *b });
        }
        *b -= n;
        Ok(())
    }
    fn balance(&self) -> u64 {
        *self.balance.lock().unwrap()
    }
}

fn main() {
    let acct = Arc::new(Account::default());
    let handles: Vec<_> = (0..8)
        .map(|_| {
            let a = Arc::clone(&acct);
            thread::spawn(move || (0..1000).for_each(|_| a.deposit(1)))
        })
        .collect();
    handles.into_iter().for_each(|h| h.join().unwrap());
    println!("{}", acct.balance());
    println!("{:?}", acct.withdraw(1_000_000));
}
