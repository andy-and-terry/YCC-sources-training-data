// A class exposing an @InvocableMethod so it can be called as an action
// from Flow Builder or Process Builder, taking wrapped request objects
// and returning wrapped responses (Apex's convention for invocable I/O).
public class InvocableMethodDemo {
    public class Request {
        @InvocableVariable(required=true)
        public Decimal amount;

        @InvocableVariable(required=true)
        public Decimal discountPercent;
    }

    public class Response {
        @InvocableVariable
        public Decimal finalAmount;
    }

    @InvocableMethod(label='Apply Discount' description='Applies a percentage discount to an amount')
    public static List<Response> applyDiscount(List<Request> requests) {
        List<Response> results = new List<Response>();
        for (Request req : requests) {
            Response res = new Response();
            res.finalAmount = req.amount - (req.amount * req.discountPercent / 100);
            results.add(res);
        }
        return results;
    }

    public static void main() {
        Request req = new Request();
        req.amount = 200;
        req.discountPercent = 15;
        List<Response> results = applyDiscount(new List<Request>{req});
        System.debug(results[0].finalAmount);
    }
}
