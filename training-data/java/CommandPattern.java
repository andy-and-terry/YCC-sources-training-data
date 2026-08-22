import java.util.ArrayDeque;
import java.util.Deque;

public class CommandPattern {
    interface Command {
        void execute();
        void undo();
    }

    static class Light {
        boolean on = false;
    }

    static class TurnOnCommand implements Command {
        private final Light light;

        TurnOnCommand(Light light) {
            this.light = light;
        }

        public void execute() {
            light.on = true;
        }

        public void undo() {
            light.on = false;
        }
    }

    static class CommandHistory {
        private final Deque<Command> history = new ArrayDeque<>();

        void execute(Command command) {
            command.execute();
            history.push(command);
        }

        void undoLast() {
            if (!history.isEmpty()) history.pop().undo();
        }
    }

    public static void main(String[] args) {
        Light light = new Light();
        CommandHistory history = new CommandHistory();
        history.execute(new TurnOnCommand(light));
        System.out.println(light.on);
        history.undoLast();
        System.out.println(light.on);
    }
}
