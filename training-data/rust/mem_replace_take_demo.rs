use std::mem;

// std::mem::take/replace/swap let you move a value out of a place
// you only have &mut access to, by leaving a cheap placeholder
// behind instead of needing to clone.
#[derive(Debug)]
struct Buffer {
    data: Vec<i32>,
}

impl Buffer {
    // Drains the buffer's contents, leaving an empty Vec (its
    // Default) in place -- no clone of `data` required.
    fn drain_all(&mut self) -> Vec<i32> {
        mem::take(&mut self.data)
    }
}

enum State {
    Loading,
    Ready(String),
}

// Consumes the old state by value to build the new one, using
// mem::replace to swap it out of `*state` first since we can't move
// out of a mutable reference directly.
fn finish_loading(state: &mut State, payload: String) {
    let old = mem::replace(state, State::Loading);
    *state = match old {
        State::Loading => State::Ready(payload),
        State::Ready(_) => old,
    };
}

fn main() {
    let mut buf = Buffer { data: vec![1, 2, 3] };
    let drained = buf.drain_all();
    println!("drained: {:?}, remaining: {:?}", drained, buf.data);

    let mut state = State::Loading;
    finish_loading(&mut state, "payload-1".to_string());
    match &state {
        State::Loading => println!("still loading"),
        State::Ready(p) => println!("ready: {}", p),
    }

    let mut a = String::from("left");
    let mut b = String::from("right");
    mem::swap(&mut a, &mut b);
    println!("a={}, b={}", a, b);
}
