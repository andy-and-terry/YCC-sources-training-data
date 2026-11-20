\ Print a string with consecutive duplicate characters removed.
variable prev
: dedupe ( addr len -- )
  0 prev ! over + swap ?do
    i c@ dup prev @ <> if dup emit then prev !
  loop cr ;
s" aabbbcdd" dedupe
