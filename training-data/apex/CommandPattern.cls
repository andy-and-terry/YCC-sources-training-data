public class CommandPattern {
    public interface Command {
        void execute();
        void undo();
    }

    public class Light {
        public Boolean isOn = false;
    }

    public class TurnOnCommand implements Command {
        private Light light;
        public TurnOnCommand(Light light) {
            this.light = light;
        }
        public void execute() {
            light.isOn = true;
        }
        public void undo() {
            light.isOn = false;
        }
    }

    public class TurnOffCommand implements Command {
        private Light light;
        public TurnOffCommand(Light light) {
            this.light = light;
        }
        public void execute() {
            light.isOn = false;
        }
        public void undo() {
            light.isOn = true;
        }
    }

    public class RemoteControl {
        private List<Command> history = new List<Command>();

        public void submit(Command cmd) {
            cmd.execute();
            history.add(cmd);
        }

        public void undoLast() {
            if (!history.isEmpty()) {
                Command last = history.remove(history.size() - 1);
                last.undo();
            }
        }
    }

    public static void main() {
        Light light = new Light();
        RemoteControl remote = new RemoteControl();

        remote.submit(new TurnOnCommand(light));
        System.debug('Light on: ' + light.isOn);

        remote.undoLast();
        System.debug('Light on after undo: ' + light.isOn);
    }
}
