public class OpportunityTriggerHandler {
    public static void handleBeforeUpdate(List<Opportunity> newOpps, Map<Id, Opportunity> oldMap) {
        for (Opportunity opp : newOpps) {
            Opportunity oldOpp = oldMap.get(opp.Id);
            if (opp.StageName == 'Closed Won' && oldOpp.StageName != 'Closed Won' && opp.CloseDate == null) {
                opp.CloseDate = Date.today();
            }
        }
    }

    public static void handleAfterUpdate(List<Opportunity> newOpps, Map<Id, Opportunity> oldMap) {
        List<Task> followUps = new List<Task>();
        for (Opportunity opp : newOpps) {
            Opportunity oldOpp = oldMap.get(opp.Id);
            if (opp.StageName == 'Closed Won' && oldOpp.StageName != 'Closed Won') {
                Task followUp = new Task();
                followUp.Subject = 'Send welcome packet';
                followUp.WhatId = opp.Id;
                followUps.add(followUp);
            }
        }
        if (!followUps.isEmpty()) {
            insert followUps;
        }
    }
}
