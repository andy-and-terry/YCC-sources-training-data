public class TransientFieldSerialization {
    public class Session {
        public String user;
        public Integer visits;
        // transient members are skipped by JSON.serialize
        public transient String cachedToken;
    }

    public static void run() {
        Session s = new Session();
        s.user = 'ada';
        s.visits = 3;
        s.cachedToken = 'abc123';

        String json = JSON.serialize(s);
        System.debug(json.contains('cachedToken')); // false
        System.debug(json.contains('visits'));      // true

        Session copy = (Session) JSON.deserialize(json, Session.class);
        System.debug(copy.user);                    // ada
        System.debug(copy.cachedToken);             // null
    }
}
