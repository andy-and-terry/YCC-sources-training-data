class GlyphStyle {
  constructor(
    readonly font: string,
    readonly size: number,
    readonly bold: boolean,
  ) {}
}

class StyleFactory {
  private cache = new Map<string, GlyphStyle>();

  get(font: string, size: number, bold: boolean): GlyphStyle {
    const key = `${font}|${size}|${bold}`;
    let style = this.cache.get(key);
    if (!style) {
      style = new GlyphStyle(font, size, bold);
      this.cache.set(key, style);
    }
    return style;
  }

  get size(): number {
    return this.cache.size;
  }
}

const factory = new StyleFactory();
const text = [..."hello world"].map((ch) => ({
  ch,
  style: factory.get("Mono", ch === "o" ? 14 : 12, ch === "h"),
}));

console.log(text.length, factory.size);
console.log(text[0].style === factory.get("Mono", 12, true));
