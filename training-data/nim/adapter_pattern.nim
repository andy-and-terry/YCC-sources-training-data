import strutils

type
  Target = ref object of RootObj

  LegacyPrinter = ref object
    ## Incompatible interface: takes a raw string and an uppercase flag
    ## instead of the single `render` method callers expect.

method render(t: Target, text: string): string {.base.} =
  discard

proc legacyPrint(p: LegacyPrinter, text: string, shout: bool): string =
  if shout: text.toUpperAscii else: text

type
  PrinterAdapter = ref object of Target
    legacy: LegacyPrinter

method render(a: PrinterAdapter, text: string): string =
  legacyPrint(a.legacy, text, shout = true)

let adapter = PrinterAdapter(legacy: LegacyPrinter())
echo render(adapter, "hello world")
