public class ObserverPattern {
    public interface Observer {
        void update(String event);
    }

    public class EmailObserver implements Observer {
        public void update(String event) {
            System.debug('Email notification: ' + event);
        }
    }

    public class SmsObserver implements Observer {
        public void update(String event) {
            System.debug('SMS notification: ' + event);
        }
    }

    public class Subject {
        private List<Observer> observers = new List<Observer>();

        public void subscribe(Observer observer) {
            observers.add(observer);
        }

        public void notifyAll(String event) {
            for (Observer observer : observers) {
                observer.update(event);
            }
        }
    }

    public static void main() {
        Subject subject = new Subject();
        subject.subscribe(new EmailObserver());
        subject.subscribe(new SmsObserver());
        subject.notifyAll('Order Shipped');
    }
}
