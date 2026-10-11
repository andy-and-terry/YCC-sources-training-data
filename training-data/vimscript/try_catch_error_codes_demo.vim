" Matching specific Vim error numbers in catch clauses.
try
  call undefined_function_xyz()
catch /E117/
  echo 'E117: unknown function'
endtry
try
  let s:l = [1, 2]
  echo s:l[5]
catch /E684/
  echo 'E684: list index out of range'
endtry
try
  echo {}.nokey
catch /E716/
  echo 'E716: key not present'
endtry
try
  echo 'a' + {}
catch /E728/
  echo 'E728: dict used as number'
endtry
