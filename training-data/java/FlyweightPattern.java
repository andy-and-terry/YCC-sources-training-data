import java.util.HashMap;
import java.util.Map;

public class FlyweightPattern {
    interface Glyph {
        void render(int x, int y);
    }

    static class CharacterGlyph implements Glyph {
        private final char symbol;
        private final String font;

        CharacterGlyph(char symbol, String font) {
            this.symbol = symbol;
            this.font = font;
        }

        @Override
        public void render(int x, int y) {
            System.out.println("'" + symbol + "' (" + font + ") at (" + x + "," + y + ")");
        }
    }

    static class GlyphFactory {
        private final Map<String, Glyph> pool = new HashMap<>();

        Glyph getGlyph(char symbol, String font) {
            String key = symbol + "|" + font;
            return pool.computeIfAbsent(key, k -> new CharacterGlyph(symbol, font));
        }

        int poolSize() {
            return pool.size();
        }
    }

    public static void main(String[] args) {
        GlyphFactory factory = new GlyphFactory();
        String text = "hello";
        int x = 0;
        for (char c : text.toCharArray()) {
            Glyph g = factory.getGlyph(c, "monospace");
            g.render(x, 0);
            x += 10;
        }
        System.out.println("distinct glyphs created: " + factory.poolSize());
    }
}
