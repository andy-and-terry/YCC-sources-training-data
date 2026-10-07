function! NewSubject()
  return {'observers': [], 'state': 0}
endfunction

function! Attach(subject, observer_fn)
  call add(a:subject.observers, a:observer_fn)
endfunction

function! SetState(subject, value)
  let a:subject.state = a:value
  for Observer in a:subject.observers
    call Observer(a:value)
  endfor
endfunction

function! NotifyA(value)
  echo 'A notified: ' . a:value
endfunction

function! NotifyB(value)
  echo 'B notified: ' . a:value
endfunction

let subject = NewSubject()
call Attach(subject, function('NotifyA'))
call Attach(subject, function('NotifyB'))

call SetState(subject, 5)
call SetState(subject, 10)
