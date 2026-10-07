public class FactoryPattern {
    public interface Notifier {
        String send(String message);
    }

    public class EmailNotifier implements Notifier {
        public String send(String message) {
            return 'Email sent: ' + message;
        }
    }

    public class SmsNotifier implements Notifier {
        public String send(String message) {
            return 'SMS sent: ' + message;
        }
    }

    public class SlackNotifier implements Notifier {
        public String send(String message) {
            return 'Slack message sent: ' + message;
        }
    }

    public class UnknownNotifierTypeException extends Exception {}

    public static Notifier createNotifier(String channel) {
        if (channel == 'email') {
            return new EmailNotifier();
        } else if (channel == 'sms') {
            return new SmsNotifier();
        } else if (channel == 'slack') {
            return new SlackNotifier();
        }
        throw new UnknownNotifierTypeException('No notifier for channel: ' + channel);
    }

    public static void main() {
        List<String> channels = new List<String>{ 'email', 'sms', 'slack' };
        for (String channel : channels) {
            Notifier notifier = createNotifier(channel);
            System.debug(notifier.send('Order shipped'));
        }
    }
}
