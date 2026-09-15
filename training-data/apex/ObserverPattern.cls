public class ObserverPattern {
    public interface Observer {
        void update(String event);
    }

    public class LoggingObserver implements Observer {
        public List<String> log = new List<String>();

        public void update(String event) {
            log.add('logged: ' + event);
        }
    }

    public class AlertObserver implements Observer {
        public List<String> alerts = new List<String>();

        public void update(String event) {
            alerts.add('alert: ' + event);
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
        ObserverPattern outer = new ObserverPattern();
        LoggingObserver logger = outer.new LoggingObserver();
        AlertObserver alerter = outer.new AlertObserver();

        subject.subscribe(logger);
        subject.subscribe(alerter);
        subject.notifyAll('order placed');

        System.debug(logger.log);
        System.debug(alerter.alerts);
    }
}
