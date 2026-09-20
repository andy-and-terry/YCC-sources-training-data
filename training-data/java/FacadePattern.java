public class FacadePattern {
    // Each subsystem has its own, more complex interface than callers
    // usually need.
    static class Amplifier {
        void on() {
            System.out.println("amplifier on");
        }

        void setVolume(int level) {
            System.out.println("amplifier volume set to " + level);
        }

        void off() {
            System.out.println("amplifier off");
        }
    }

    static class Projector {
        void on() {
            System.out.println("projector on");
        }

        void setInput(String source) {
            System.out.println("projector input set to " + source);
        }

        void off() {
            System.out.println("projector off");
        }
    }

    static class StreamingPlayer {
        void on() {
            System.out.println("streaming player on");
        }

        void play(String title) {
            System.out.println("now playing: " + title);
        }

        void stop() {
            System.out.println("streaming player stopped");
        }
    }

    // The facade exposes one simple entry point that coordinates all three
    // subsystems, hiding their individual setup order and details.
    static class HomeTheaterFacade {
        private final Amplifier amplifier;
        private final Projector projector;
        private final StreamingPlayer player;

        HomeTheaterFacade(Amplifier amplifier, Projector projector, StreamingPlayer player) {
            this.amplifier = amplifier;
            this.projector = projector;
            this.player = player;
        }

        void watchMovie(String title) {
            projector.on();
            projector.setInput("HDMI1");
            amplifier.on();
            amplifier.setVolume(7);
            player.on();
            player.play(title);
        }

        void endMovie() {
            player.stop();
            amplifier.off();
            projector.off();
        }
    }

    public static void main(String[] args) {
        HomeTheaterFacade homeTheater =
            new HomeTheaterFacade(new Amplifier(), new Projector(), new StreamingPlayer());
        homeTheater.watchMovie("The Matrix");
        System.out.println("--- movie over ---");
        homeTheater.endMovie();
    }
}
