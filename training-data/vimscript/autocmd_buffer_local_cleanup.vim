let g:buffer_state = {}

function! s:InitBufferState()
  let g:buffer_state[bufnr('%')] = {'visits': 0}
  augroup BufferStateTracker
    autocmd! * <buffer>
    autocmd BufEnter <buffer> let g:buffer_state[bufnr('%')].visits += 1
    autocmd BufWipeout <buffer> call remove(g:buffer_state, expand('<abuf>'))
  augroup END
endfunction

call s:InitBufferState()

doautocmd BufEnter
doautocmd BufEnter
echo g:buffer_state[bufnr('%')].visits

let tracked_buf = bufnr('%')
doautocmd BufWipeout
echo has_key(g:buffer_state, tracked_buf)
