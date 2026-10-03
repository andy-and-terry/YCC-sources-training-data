use std::cell::RefCell;

trait Image {
    fn display(&self) -> String;
}

struct RealImage {
    filename: String,
}

impl RealImage {
    fn new(filename: &str) -> Self {
        println!("loading {filename} from disk (expensive)");
        RealImage { filename: filename.to_string() }
    }
}

impl Image for RealImage {
    fn display(&self) -> String {
        format!("displaying {}", self.filename)
    }
}

/// Virtual proxy: defers the expensive load until display() is first called.
struct ImageProxy {
    filename: String,
    real_image: RefCell<Option<RealImage>>,
}

impl ImageProxy {
    fn new(filename: &str) -> Self {
        ImageProxy { filename: filename.to_string(), real_image: RefCell::new(None) }
    }
}

impl Image for ImageProxy {
    fn display(&self) -> String {
        let mut slot = self.real_image.borrow_mut();
        if slot.is_none() {
            *slot = Some(RealImage::new(&self.filename));
        }
        slot.as_ref().unwrap().display()
    }
}

fn main() {
    let proxy = ImageProxy::new("diagram.png");
    println!("proxy created, image not loaded yet");
    println!("{}", proxy.display());
    println!("{}", proxy.display());
}
