public class SObjectCloneDemo {
    public static void run() {
        Account original = new Account(Name = 'Original', Industry = 'Tech');

        // Reference copy: both variables point at the same record.
        Account sameRef = original;
        sameRef.Name = 'Changed';
        System.debug(original.Name);          // Changed

        // clone(preserveId, deepClone, preserveReadonlyTimestamps, preserveAutonumber)
        Account copy = original.clone(false, true, false, false);
        copy.Name = 'Copy';
        System.debug(original.Name);          // still Changed
        System.debug(copy.Name);              // Copy

        // Dynamic field access via get/put.
        copy.put('Industry', 'Finance');
        System.debug(copy.get('Industry'));
    }
}
