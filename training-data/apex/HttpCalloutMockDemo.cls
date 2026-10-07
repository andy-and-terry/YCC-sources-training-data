@isTest
public class HttpCalloutMockDemo {
    public class MockResponse implements HttpCalloutMock {
        public HttpResponse respond(HttpRequest req) {
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            res.setBody('{"status":"ok"}');
            res.setStatusCode(200);
            return res;
        }
    }

    @isTest
    static void testCallout() {
        Test.setMock(HttpCalloutMock.class, new MockResponse());

        Test.startTest();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://example.com/api');
        req.setMethod('GET');
        HttpResponse res = new Http().send(req);
        Test.stopTest();

        System.assertEquals(200, res.getStatusCode());
        Map<String, Object> body = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
        System.assertEquals('ok', body.get('status'));
    }
}
