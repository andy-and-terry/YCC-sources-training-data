command! -nargs=1 Greet echo 'Hello, ' . <q-args>
command! -range=% Count echo <line2> - <line1> + 1
Greet world
