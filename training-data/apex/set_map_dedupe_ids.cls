public class Dedupe {
    public static Set<Id> uniqueOwners(List<Account> accts) {
        Set<Id> owners = new Set<Id>();
        for (Account a : accts) owners.add(a.OwnerId);
        return owners;
    }
}
