public class FacadePattern {
    static class Cpu {
        void freeze() {
            System.out.println("cpu: freeze");
        }

        void jump(int position) {
            System.out.println("cpu: jump to " + position);
        }

        void execute() {
            System.out.println("cpu: execute");
        }
    }

    static class Memory {
        void load(int position, String data) {
            System.out.println("memory: load " + data + " at " + position);
        }
    }

    static class HardDrive {
        String read(int sector, int size) {
            System.out.println("hard drive: reading sector " + sector);
            return "boot-sector-data";
        }
    }

    static class ComputerFacade {
        private final Cpu cpu = new Cpu();
        private final Memory memory = new Memory();
        private final HardDrive drive = new HardDrive();

        void start() {
            cpu.freeze();
            String data = drive.read(0, 512);
            memory.load(0, data);
            cpu.jump(0);
            cpu.execute();
        }
    }

    public static void main(String[] args) {
        ComputerFacade computer = new ComputerFacade();
        computer.start();
    }
}
