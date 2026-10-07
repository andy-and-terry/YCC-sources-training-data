interface Image {
    fun display()
}

class RealImage(private val filename: String) : Image {
    init {
        println("loading image from disk: $filename")
    }

    override fun display() = println("displaying $filename")
}

class ImageProxy(private val filename: String) : Image {
    private var realImage: RealImage? = null

    override fun display() {
        if (realImage == null) {
            realImage = RealImage(filename)
        }
        realImage!!.display()
    }
}

fun main() {
    val proxy: Image = ImageProxy("landscape.png")
    println("proxy created, image not loaded yet")
    proxy.display()
    proxy.display()
}
