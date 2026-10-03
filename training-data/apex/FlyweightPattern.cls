public class FlyweightPattern {
    // Shared, immutable "intrinsic" state kept in a flyweight, reused
    // across many logical trees instead of allocated per instance.
    public class TreeType {
        public String name;
        public String color;
        public TreeType(String name, String color) {
            this.name = name;
            this.color = color;
        }
        public String render(Integer x, Integer y) {
            return name + '(' + color + ') at (' + x + ',' + y + ')';
        }
    }

    public class TreeTypeFactory {
        private Map<String, TreeType> cache = new Map<String, TreeType>();

        public TreeType getTreeType(String name, String color) {
            String key = name + ':' + color;
            if (!cache.containsKey(key)) {
                cache.put(key, new TreeType(name, color));
            }
            return cache.get(key);
        }
    }

    public static void main() {
        TreeTypeFactory factory = new TreeTypeFactory();
        TreeType oak1 = factory.getTreeType('Oak', 'Green');
        TreeType oak2 = factory.getTreeType('Oak', 'Green');
        System.debug('Same flyweight instance: ' + (oak1 === oak2));
        System.debug(oak1.render(1, 2));
        System.debug(oak2.render(5, 9));
    }
}
