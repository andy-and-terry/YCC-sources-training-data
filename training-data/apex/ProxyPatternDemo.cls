public class ProxyPatternDemo {
    public interface Image {
        String display();
    }

    public class RealImage implements Image {
        private String filename;
        public RealImage(String filename) {
            this.filename = filename;
            loadFromDisk();
        }
        private void loadFromDisk() {
            System.debug('Loading ' + filename + ' from disk');
        }
        public String display() {
            return 'Displaying ' + filename;
        }
    }

    public class ImageProxy implements Image {
        private String filename;
        private RealImage real;
        public ImageProxy(String filename) {
            this.filename = filename;
        }
        public String display() {
            if (real == null) {
                real = new RealImage(filename);
            }
            return real.display();
        }
    }

    public static void main() {
        Image img = new ImageProxy('photo.png');
        System.debug('Proxy created, image not loaded yet');
        System.debug(img.display());
    }
}
