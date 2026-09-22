public class SafeNavigationDemo {
    public class Address {
        public String city;
    }

    public class Contact {
        public String name;
        public Address address;
    }

    // The safe navigation operator (?.) short-circuits to null instead of
    // throwing a NullPointerException when the left-hand side is null.
    public static String getCity(Contact c) {
        return c?.address?.city;
    }

    // The null coalescing operator (??) supplies a fallback when the
    // left-hand expression evaluates to null.
    public static String describeCity(Contact c) {
        return getCity(c) ?? 'Unknown city';
    }

    public static void main() {
        Contact withCity = new Contact();
        withCity.name = 'Ada';
        withCity.address = new Address();
        withCity.address.city = 'Springfield';

        Contact withoutAddress = new Contact();
        withoutAddress.name = 'Grace';

        Contact nullContact = null;

        System.debug(describeCity(withCity));
        System.debug(describeCity(withoutAddress));
        System.debug(describeCity(nullContact));
    }
}
