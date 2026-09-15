interface Image {
  display(): void;
}

class RealImage implements Image {
  constructor(private filename: string) {
    this.loadFromDisk();
  }

  private loadFromDisk(): void {
    console.log(`loading ${this.filename} from disk`);
  }

  display(): void {
    console.log(`displaying ${this.filename}`);
  }
}

class ImageProxy implements Image {
  private realImage: RealImage | null = null;

  constructor(private filename: string) {}

  display(): void {
    if (this.realImage === null) {
      this.realImage = new RealImage(this.filename);
    }
    this.realImage.display();
  }
}

const image: Image = new ImageProxy("photo.png");
console.log("proxy created, image not loaded yet");
image.display(); // loads then displays
image.display(); // just displays, no reload
