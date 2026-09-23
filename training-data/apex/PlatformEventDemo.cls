public class PlatformEventDemo {
    public static Database.SaveResult publishEvent(SObject platformEvent) {
        Database.SaveResult result = EventBus.publish(platformEvent);
        if (result.isSuccess()) {
            System.debug('Event published with Id: ' + result.getId());
        } else {
            for (Database.Error err : result.getErrors()) {
                System.debug('Event publish failed: ' + err.getMessage());
            }
        }
        return result;
    }

    public static List<Database.SaveResult> publishEvents(List<SObject> platformEvents) {
        return EventBus.publish(platformEvents);
    }

    public static void main() {
        // In a real org this would be a concrete platform event type, e.g.
        // new Order_Status_Change__e(Status__c = 'Shipped').
        System.debug('Platform event publishing helper ready.');
    }
}
