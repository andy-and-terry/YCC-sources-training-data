using System;
using System.Collections.Generic;

class GlyphStyle
{
    public readonly string Font;
    public GlyphStyle(string font) => Font = font;
}

class GlyphStyleFactory
{
    private readonly Dictionary<string, GlyphStyle> styles = new();

    public GlyphStyle GetStyle(string font)
    {
        if (!styles.TryGetValue(font, out var style))
        {
            style = new GlyphStyle(font);
            styles[font] = style;
        }
        return style;
    }

    public int StyleCount => styles.Count;
}

class Glyph
{
    private readonly char character;
    private readonly GlyphStyle style;

    public Glyph(char character, GlyphStyle style)
    {
        this.character = character;
        this.style = style;
    }

    public string Render() => $"{character}[{style.Font}]";
}

class FlyweightPatternDemo
{
    static void Main()
    {
        var factory = new GlyphStyleFactory();
        var text = "abcabc";
        var glyphs = new List<Glyph>();

        foreach (char c in text)
            glyphs.Add(new Glyph(c, factory.GetStyle("Arial")));

        foreach (var glyph in glyphs)
            Console.Write(glyph.Render());
        Console.WriteLine();
        Console.WriteLine($"shared styles: {factory.StyleCount}");
    }
}
