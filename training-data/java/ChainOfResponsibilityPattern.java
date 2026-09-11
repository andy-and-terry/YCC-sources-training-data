public class ChainOfResponsibilityPattern {
    enum Level { INFO, WARNING, ERROR }

    abstract static class Handler {
        private Handler next;

        Handler setNext(Handler next) {
            this.next = next;
            return next;
        }

        void handle(Level level, String message) {
            if (canHandle(level)) {
                process(message);
            } else if (next != null) {
                next.handle(level, message);
            } else {
                System.out.println("unhandled: " + message);
            }
        }

        abstract boolean canHandle(Level level);

        abstract void process(String message);
    }

    static class InfoHandler extends Handler {
        boolean canHandle(Level level) {
            return level == Level.INFO;
        }

        void process(String message) {
            System.out.println("[INFO] " + message);
        }
    }

    static class WarningHandler extends Handler {
        boolean canHandle(Level level) {
            return level == Level.WARNING;
        }

        void process(String message) {
            System.out.println("[WARNING] " + message);
        }
    }

    static class ErrorHandler extends Handler {
        boolean canHandle(Level level) {
            return level == Level.ERROR;
        }

        void process(String message) {
            System.out.println("[ERROR] " + message);
        }
    }

    public static void main(String[] args) {
        Handler chain = new InfoHandler();
        chain.setNext(new WarningHandler()).setNext(new ErrorHandler());

        chain.handle(Level.INFO, "server started");
        chain.handle(Level.WARNING, "disk usage high");
        chain.handle(Level.ERROR, "connection lost");
    }
}
