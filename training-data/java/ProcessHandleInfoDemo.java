import java.util.Optional;

public class ProcessHandleInfoDemo {
    public static void main(String[] args) {
        ProcessHandle me = ProcessHandle.current();
        ProcessHandle.Info info = me.info();

        System.out.println("pid positive: " + (me.pid() > 0));
        System.out.println("alive: " + me.isAlive());

        Optional<String> command = info.command();
        System.out.println("has command: " + command.isPresent());

        // Info fields are all Optional because the OS may hide them
        String user = info.user().orElse("unknown");
        System.out.println("user known: " + !user.isEmpty());

        long children = me.children().count();
        System.out.println("children: " + children);

        // Parent is optional too
        me.parent().ifPresent(p -> System.out.println("parent pid positive: " + (p.pid() > 0)));

        // Count of live descendants (zero here)
        System.out.println("descendants: " + me.descendants().count());
    }
}
