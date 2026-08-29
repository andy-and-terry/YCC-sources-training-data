public class EnumDemo {
    public enum Status { NEW, IN_PROGRESS, DONE }

    public static String describe(Status s) {
        switch on s {
            when NEW {
                return 'Just created';
            }
            when IN_PROGRESS {
                return 'Being worked on';
            }
            when DONE {
                return 'Completed';
            }
            when else {
                return 'Unknown';
            }
        }
    }

    public static void main() {
        System.debug(describe(Status.IN_PROGRESS));
    }
}
