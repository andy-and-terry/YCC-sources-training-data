public class InterfacesAbstractVirtual {
    public interface Notifier { String send(String msg); }

    public abstract class BaseNotifier implements Notifier {
        protected String channel;
        public BaseNotifier(String c) { this.channel = c; }
        public abstract String format(String msg);
        public virtual String send(String msg) { return channel + ': ' + format(msg); }
    }

    public class EmailNotifier extends BaseNotifier {
        public EmailNotifier() { super('email'); }
        public override String format(String msg) { return '<p>' + msg + '</p>'; }
    }

    public class SmsNotifier extends BaseNotifier {
        public SmsNotifier() { super('sms'); }
        public override String format(String msg) { return msg.abbreviate(10); }
        public override String send(String msg) { return super.send(msg) + ' [short]'; }
    }

    public static List<String> broadcast(String m) {
        List<Notifier> ns = new List<Notifier>{ new EmailNotifier(), new SmsNotifier() };
        List<String> out = new List<String>();
        for (Notifier n : ns) out.add(n.send(m));
        return out;
    }
}
