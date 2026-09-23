import java.util.List;

public class NullObjectPattern {
    interface Logger {
        void log(String message);
    }

    static class ConsoleLogger implements Logger {
        public void log(String message) {
            System.out.println("[LOG] " + message);
        }
    }

    static class NullLogger implements Logger {
        public void log(String message) {
            // intentionally does nothing
        }
    }

    static class Service {
        private final Logger logger;

        Service(Logger logger) {
            this.logger = logger;
        }

        void process(String item) {
            logger.log("processing " + item);
        }
    }

    static Logger findLogger(String name, java.util.Map<String, Logger> registry) {
        return registry.getOrDefault(name, new NullLogger());
    }

    public static void main(String[] args) {
        var registry = java.util.Map.<String, Logger>of("console", new ConsoleLogger());

        Service withLogger = new Service(findLogger("console", registry));
        Service withoutLogger = new Service(findLogger("missing", registry));

        for (String item : List.of("order-1", "order-2")) {
            withLogger.process(item);
            withoutLogger.process(item);
        }
        System.out.println("done, no null checks needed");
    }
}
