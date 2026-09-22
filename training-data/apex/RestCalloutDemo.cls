public class RestCalloutDemo {
    public static String fetchStatus(String endpoint) {
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);
        req.setMethod('GET');
        req.setTimeout(10000);

        Http http = new Http();
        HttpResponse res = http.send(req);

        if (res.getStatusCode() == 200) {
            return res.getBody();
        }
        return 'Error: HTTP ' + res.getStatusCode();
    }

    public static void main() {
        String result = fetchStatus('https://example.com/api/status');
        System.debug(result);
    }
}
