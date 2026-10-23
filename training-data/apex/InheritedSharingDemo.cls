// "inherited sharing" makes a class run with the sharing mode of its caller.
// Entry points (triggers, anonymous Apex, Visualforce, REST) default to
// "with sharing" behaviour, so the same class is safe to reuse everywhere.
public inherited sharing class InheritedSharingDemo {

    public static Integer countVisibleAccounts() {
        return [SELECT COUNT() FROM Account];
    }

    // A nested class can opt in to a stricter or looser mode explicitly.
    public with sharing class StrictReader {
        public Integer count() {
            return [SELECT COUNT() FROM Account];
        }
    }

    public without sharing class SystemReader {
        public Integer count() {
            return [SELECT COUNT() FROM Account];
        }
    }

    public static void main() {
        System.debug('Inherited: ' + countVisibleAccounts());
        System.debug('Strict: ' + new StrictReader().count());
        System.debug('System: ' + new SystemReader().count());
    }
}
