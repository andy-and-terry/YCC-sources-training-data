// Apex REST endpoint: served at /services/apexrest/accounts/<id>
@RestResource(urlMapping='/accounts/*')
global with sharing class RestResourceSketch {

    global class AccountSummary {
        public String id;
        public String name;
        public Integer contactCount;
    }

    @HttpGet
    global static AccountSummary doGet() {
        RestRequest req = RestContext.request;
        String accountId = req.requestURI.substringAfterLast('/');

        Account acc = [SELECT Id, Name, (SELECT Id FROM Contacts)
                       FROM Account WHERE Id = :accountId LIMIT 1];

        AccountSummary summary = new AccountSummary();
        summary.id = acc.Id;
        summary.name = acc.Name;
        summary.contactCount = acc.Contacts.size();
        return summary;   // serialized to JSON automatically
    }

    @HttpPost
    global static String doPost(String name) {
        Account acc = new Account(Name = name);
        insert acc;
        RestContext.response.statusCode = 201;
        return acc.Id;
    }

    @HttpDelete
    global static void doDelete() {
        String accountId = RestContext.request.requestURI.substringAfterLast('/');
        delete [SELECT Id FROM Account WHERE Id = :accountId];
        RestContext.response.statusCode = 204;
    }
}
