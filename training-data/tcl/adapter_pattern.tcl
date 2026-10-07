oo::class create OldPrinter {
    method printOld {text} {
        return "OLD: $text"
    }
}

oo::class create NewPrinterInterface {
    method printNew {text} {
        error "not implemented"
    }
}

oo::class create PrinterAdapter {
    superclass NewPrinterInterface
    variable old

    constructor {oldPrinter} {
        set old $oldPrinter
    }

    method printNew {text} {
        return [$old printOld $text]
    }
}

set legacy [OldPrinter new]
set adapter [PrinterAdapter new $legacy]
puts [$adapter printNew "hello"]

$legacy destroy
$adapter destroy
