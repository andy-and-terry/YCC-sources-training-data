// System.StubProvider with Test.createStub builds a mock object for a class
// without defining a hand-written subclass.
public class StubProviderMock {

    public virtual class PriceService {
        public virtual Decimal lookup(String sku) {
            // The real implementation would call an external system.
            throw new CalloutException('Not available in tests');
        }
    }

    public class OrderCalculator {
        private PriceService service;

        public OrderCalculator(PriceService service) {
            this.service = service;
        }

        public Decimal total(List<String> skus) {
            Decimal sum = 0;
            for (String sku : skus) {
                sum += service.lookup(sku);
            }
            return sum;
        }
    }

    public class PriceServiceStub implements System.StubProvider {
        public Object handleMethodCall(
            Object stubbedObject,
            String stubbedMethodName,
            Type returnType,
            List<Type> listOfParamTypes,
            List<String> listOfParamNames,
            List<Object> listOfArgs
        ) {
            if (stubbedMethodName == 'lookup') {
                return listOfArgs[0] == 'A100' ? 10.50 : 4.25;
            }
            return null;
        }
    }

    // Test.createStub may only be called from a test context (e.g. an @IsTest
    // method); main() shows the wiring.
    public static void main() {
        PriceService mock = (PriceService) Test.createStub(
            PriceService.class,
            new PriceServiceStub()
        );
        OrderCalculator calc = new OrderCalculator(mock);
        System.debug(calc.total(new List<String>{ 'A100', 'B200' })); // 14.75
    }
}
