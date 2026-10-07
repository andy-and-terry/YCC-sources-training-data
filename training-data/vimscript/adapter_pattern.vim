function! LegacyOldPrint(content)
  echo '[legacy] ' . a:content
endfunction

function! AdapterPrintDocument(text)
  call LegacyOldPrint(a:text)
endfunction

function! RunPrinter(PrintFn, text)
  call a:PrintFn(a:text)
endfunction

call RunPrinter(function('AdapterPrintDocument'), 'Quarterly report')
