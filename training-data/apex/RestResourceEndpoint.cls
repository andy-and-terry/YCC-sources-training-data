// @RestResource exposes a global class at /services/apexrest/<urlMapping>.
// Each HTTP verb gets one annotated static method.
@RestResource(urlMapping='/demo/accounts/*')
global with sharing class RestResourceEndpoint {

    global class AccountSummary {
        public Id recordId;
        public String name;
        public Integer contactCount;
    }

    @HttpGet
    global static AccountSummary doGet() {
        RestRequest req = RestContext.request;
        String accountId = req.requestURI.substringAfterLast('/');

        Account acc = [
            SELECT Id, Name, (SELECT Id FROM Contacts)
            FROM Account
            WHERE Id = :accountId
            LIMIT 1
        ];

        AccountSummary summary = new AccountSummary();
        summary.recordId = acc.Id;
        summary.name = acc.Name;
        summary.contactCount = acc.Contacts.size();
        return summary;
    }

    @HttpPost
    global static Id doPost(String name, String industry) {
        Account acc = new Account(Name = name, Industry = industry);
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
