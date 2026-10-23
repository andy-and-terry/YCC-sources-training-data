\ MARKER defines a word that forgets everything defined after it
marker cleanup

: temp-word  42 . ;
temp-word cr

cleanup

: temp-word  99 . ;
temp-word cr
