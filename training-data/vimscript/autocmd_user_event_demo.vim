let g:event_count = 0

augroup MyUserEvents
  autocmd!
  autocmd User MyPluginReady let g:event_count += 1
  autocmd User MyPluginReady echo 'MyPluginReady fired, count=' . g:event_count
augroup END

doautocmd User MyPluginReady
doautocmd User MyPluginReady

echo g:event_count
