" lockvar prevents modification of variables and their contents.
let s:const = [1, 2, 3]
lockvar s:const
try
  call add(s:const, 4)
catch /E741/
  echo 'cannot modify locked list'
endtry
try
  let s:const = []
catch /E741/
  echo 'cannot rebind locked variable'
endtry
unlockvar s:const
call add(s:const, 4)
echo s:const
echo islocked('s:const')
