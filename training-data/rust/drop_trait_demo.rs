struct FileHandle {
    name: String,
}

impl FileHandle {
    fn new(name: &str) -> Self {
        println!("opening {}", name);
        FileHandle { name: name.to_string() }
    }
}

impl Drop for FileHandle {
    fn drop(&mut self) {
        println!("closing {}", self.name);
    }
}

struct Guard {
    handles: Vec<FileHandle>,
}

fn main() {
    {
        let _a = FileHandle::new("a.txt");
        let _b = FileHandle::new("b.txt");
        println!("using handles");
    }
    println!("scope exited");

    let guard = Guard {
        handles: vec![FileHandle::new("c.txt"), FileHandle::new("d.txt")],
    };
    drop(guard);
    println!("guard dropped early");
}
