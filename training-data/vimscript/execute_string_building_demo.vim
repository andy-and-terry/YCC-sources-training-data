function! BuildAndRunLet(varname, value)
  execute 'let ' . a:varname . ' = ' . string(a:value)
endfunction

call BuildAndRunLet('dynamic_var', 42)
echo dynamic_var

for name in ['alpha', 'beta', 'gamma']
  execute 'let s:' . name . '_flag = 1'
endfor
echo exists('s:alpha_flag') && exists('s:beta_flag') && exists('s:gamma_flag')

let commands = ['let x1 = 1', 'let x2 = x1 + 1', 'let x3 = x2 + 1']
for cmd in commands
  execute cmd
endfor
echo x3
