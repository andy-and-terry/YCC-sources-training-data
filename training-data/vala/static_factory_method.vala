class Color : Object {
    public uint8 r { get; private set; }
    public uint8 g { get; private set; }
    public uint8 b { get; private set; }

    private Color (uint8 r, uint8 g, uint8 b) {
        Object ();
        this.r = r;
        this.g = g;
        this.b = b;
    }

    public static Color from_rgb (uint8 r, uint8 g, uint8 b) {
        return new Color (r, g, b);
    }

    public static Color from_hex (uint32 hex) {
        return new Color ((uint8) ((hex >> 16) & 0xFF), (uint8) ((hex >> 8) & 0xFF), (uint8) (hex & 0xFF));
    }

    public string to_hex () {
        return "#%02x%02x%02x".printf (r, g, b);
    }
}

void main () {
    var red = Color.from_rgb (255, 0, 0);
    var teal = Color.from_hex (0x008080);
    stdout.printf ("%s %s\n", red.to_hex (), teal.to_hex ());
}
