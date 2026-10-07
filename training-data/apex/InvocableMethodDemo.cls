public class InvocableMethodDemo {
    public class Request {
        @InvocableVariable(label='Account Id' required=true)
        public Id accountId;
        @InvocableVariable(label='New Rating')
        public String rating;
    }

    public class Result {
        @InvocableVariable
        public Boolean success;
        @InvocableVariable
        public String message;
    }

    // Callable from Flow and Process Builder; must be bulk-safe (list in, list out).
    @InvocableMethod(label='Update Account Rating' description='Sets Rating on accounts')
    public static List<Result> updateRating(List<Request> requests) {
        List<Account> toUpdate = new List<Account>();
        for (Request r : requests) {
            toUpdate.add(new Account(Id = r.accountId, Rating = r.rating));
        }
        update toUpdate;

        List<Result> results = new List<Result>();
        for (Request r : requests) {
            Result res = new Result();
            res.success = true;
            res.message = 'Updated ' + r.accountId;
            results.add(res);
        }
        return results;
    }
}
