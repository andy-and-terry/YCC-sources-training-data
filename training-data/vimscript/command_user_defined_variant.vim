command! -nargs=1 Greet echo 'Hello, ' . <q-args>
command! -range=% CountLines echo line('$')
Greet World
