public class SafeNav {
    public static String ownerName(Account a) {
        return a?.Owner?.Name ?? 'Unknown';
    }
}
