function! BuildAndRun(var_name, value)
  execute 'let g:' . a:var_name . ' = ' . a:value
endfunction

call BuildAndRun('dynamic_result', 42)
echo g:dynamic_result

for i in range(1, 3)
  execute 'let g:item_' . i . ' = ' . (i * 10)
endfor
echo g:item_1 . ' ' . g:item_2 . ' ' . g:item_3
