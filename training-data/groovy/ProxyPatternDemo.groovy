class RealImage {
    String filename

    RealImage(String filename) {
        this.filename = filename
        println "loading image from disk: $filename"
    }

    void display() { println "displaying $filename" }
}

class ImageProxy {
    String filename
    private RealImage realImage

    ImageProxy(String filename) { this.filename = filename }

    void display() {
        if (realImage == null) {
            realImage = new RealImage(filename)
        }
        realImage.display()
    }
}

def proxy = new ImageProxy("landscape.png")
println "proxy created, image not loaded yet"
proxy.display()
proxy.display()
