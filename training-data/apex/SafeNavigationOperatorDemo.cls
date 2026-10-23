public class SafeNavigationOperatorDemo {
    public static void run() {
        Account acc = null;
        String name = acc?.Name;                 // null, no NullPointerException
        System.debug(name);

        Account a = new Account(Name = 'Acme');
        System.debug(a?.Name?.toUpperCase());    // ACME
        String city = a?.BillingCity ?? 'Unknown'; // null-coalescing
        System.debug(city);
    }
}
