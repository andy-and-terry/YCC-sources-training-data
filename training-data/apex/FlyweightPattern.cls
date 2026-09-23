public class FlyweightPattern {
    public class TreeType {
        private String treeName;
        private String color;
        public TreeType(String treeName, String color) {
            this.treeName = treeName;
            this.color = color;
        }
        public String display(Integer x, Integer y) {
            return treeName + ' (' + color + ') at (' + x + ',' + y + ')';
        }
    }

    // Shared, immutable intrinsic state (name/color) lives in one TreeType
    // instance per combination; per-planting extrinsic state (x, y) is
    // passed in at display time rather than stored on the flyweight.
    public class TreeFactory {
        private Map<String, TreeType> treeTypes = new Map<String, TreeType>();

        public TreeType getTreeType(String treeName, String color) {
            String key = treeName + '_' + color;
            if (!treeTypes.containsKey(key)) {
                treeTypes.put(key, new TreeType(treeName, color));
                System.debug('Created new TreeType for ' + key);
            }
            return treeTypes.get(key);
        }

        public Integer typeCount() {
            return treeTypes.size();
        }
    }

    public static void main() {
        TreeFactory factory = new TreeFactory();
        List<List<Integer>> plantings = new List<List<Integer>>{
            new List<Integer>{1, 1},
            new List<Integer>{2, 2},
            new List<Integer>{3, 3}
        };
        for (List<Integer> pos : plantings) {
            TreeType oak = factory.getTreeType('Oak', 'Green');
            System.debug(oak.display(pos[0], pos[1]));
        }
        factory.getTreeType('Pine', 'DarkGreen');
        System.debug('Distinct tree types created: ' + factory.typeCount());
    }
}
