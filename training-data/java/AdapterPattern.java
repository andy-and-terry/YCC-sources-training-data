public class AdapterPattern {
    interface ModernPrinter {
        String print(String text);
    }

    static class LegacyPrinter {
        String printLegacy(String text) {
            return "[legacy] " + text;
        }
    }

    static class LegacyPrinterAdapter implements ModernPrinter {
        private final LegacyPrinter legacy;

        LegacyPrinterAdapter(LegacyPrinter legacy) {
            this.legacy = legacy;
        }

        public String print(String text) {
            return legacy.printLegacy(text);
        }
    }

    static String render(ModernPrinter printer, String text) {
        return printer.print(text);
    }

    public static void main(String[] args) {
        ModernPrinter adapter = new LegacyPrinterAdapter(new LegacyPrinter());
        System.out.println(render(adapter, "hello"));
    }
}
