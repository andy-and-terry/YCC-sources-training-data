extends Node

class LegacyPrinter:
	func print_old(text: String) -> void:
		print("[legacy] %s" % text)

class PrinterInterface:
	func write(text: String) -> void:
		pass

class LegacyPrinterAdapter extends PrinterInterface:
	var legacy: LegacyPrinter

	func _init(p: LegacyPrinter) -> void:
		legacy = p

	func write(text: String) -> void:
		legacy.print_old(text)

func _ready():
	var adapter := LegacyPrinterAdapter.new(LegacyPrinter.new())
	adapter.write("hello via adapter")
