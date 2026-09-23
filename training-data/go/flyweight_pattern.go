package main

import "fmt"

type glyph struct {
	character rune
	font      string
}

type glyphFactory struct {
	cache map[string]*glyph
}

func newGlyphFactory() *glyphFactory {
	return &glyphFactory{cache: make(map[string]*glyph)}
}

func (f *glyphFactory) get(character rune, font string) *glyph {
	key := fmt.Sprintf("%c-%s", character, font)
	if g, ok := f.cache[key]; ok {
		return g
	}
	g := &glyph{character: character, font: font}
	f.cache[key] = g
	return g
}

type renderedGlyph struct {
	shared *glyph
	x, y   int
}

func main() {
	factory := newGlyphFactory()
	text := "abcabc"
	var rendered []renderedGlyph

	for i, c := range text {
		g := factory.get(c, "monospace")
		rendered = append(rendered, renderedGlyph{shared: g, x: i, y: 0})
	}

	for _, r := range rendered {
		fmt.Printf("glyph %c at (%d, %d)\n", r.shared.character, r.x, r.y)
	}
	fmt.Println("distinct glyph objects created:", len(factory.cache))
}
