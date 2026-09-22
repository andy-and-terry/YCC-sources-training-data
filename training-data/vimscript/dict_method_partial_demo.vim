function! s:Greet(greeting) dict
  return a:greeting . ', ' . self.name . '!'
endfunction

let english_speaker = {'name': 'Alice'}
let french_speaker = {'name': 'Bruno'}

" function('Name', dict) creates a partial: a Funcref bound to that dict as
" 'self', without storing the function itself inside the dict.
let english_speaker.greet = function('s:Greet', english_speaker)
let french_speaker.greet = function('s:Greet', french_speaker)

echo english_speaker.greet('Hello')
echo french_speaker.greet('Bonjour')
