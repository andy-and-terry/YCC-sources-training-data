use std::marker::PhantomData;

// The typestate pattern encodes an object's state in its type, so
// illegal transitions (e.g. reading a Locked door) are caught by the
// compiler instead of at runtime. PhantomData<S> carries the marker
// type without actually storing one, so Door has zero extra runtime
// cost over a plain struct.
struct Locked;
struct Unlocked;

struct Door<State> {
    _state: PhantomData<State>,
}

impl Door<Locked> {
    fn new() -> Self {
        Door { _state: PhantomData }
    }

    fn unlock(self, code: u32) -> Result<Door<Unlocked>, Door<Locked>> {
        if code == 1234 {
            Ok(Door { _state: PhantomData })
        } else {
            Err(self)
        }
    }
}

impl Door<Unlocked> {
    fn open(&self) -> &'static str {
        "the door swings open"
    }

    fn lock(self) -> Door<Locked> {
        Door { _state: PhantomData }
    }
}

fn main() {
    let door = Door::<Locked>::new();

    let door = match door.unlock(1111) {
        Ok(_) => panic!("should not unlock with the wrong code"),
        Err(still_locked) => still_locked,
    };

    let door = match door.unlock(1234) {
        Ok(unlocked) => unlocked,
        Err(_) => panic!("correct code should unlock"),
    };
    println!("{}", door.open());

    let _relocked = door.lock();
    // The next line would not compile: `_relocked` is Door<Locked>,
    // which has no `open` method -- the compiler enforces the
    // protocol at compile time.
    // _relocked.open();
}
