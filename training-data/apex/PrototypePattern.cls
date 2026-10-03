public class PrototypePattern {
    public interface Prototype {
        Prototype clonePrototype();
    }

    public class Config implements Prototype {
        public String environment;
        public List<String> features;

        public Config(String environment, List<String> features) {
            this.environment = environment;
            this.features = features;
        }

        public Prototype clonePrototype() {
            // Deep copy so mutating the clone never touches the original.
            return new Config(environment, features.clone());
        }
    }

    public static void main() {
        Config base = new Config('staging', new List<String>{'flagA', 'flagB'});
        Config copy = (Config) base.clonePrototype();
        copy.environment = 'production';
        copy.features.add('flagC');

        System.debug('Base: ' + base.environment + ' ' + base.features);
        System.debug('Copy: ' + copy.environment + ' ' + copy.features);
    }
}
