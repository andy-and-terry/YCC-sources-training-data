\ BWT of "banana$" via insertion sort of rotation start offsets
create idx 7 cells allot
s" banana$" 2constant txt
: ch@ ( i -- c ) txt drop + c@ ;
: rot-less? ( a b -- f )
  true 7 0 do
    over i + 7 mod ch@  over i + 7 mod ch@ ( a b ca cb )
    2dup <> if < nip nip unloop exit then 2drop
  loop 2drop drop false ;
: init 7 0 do i idx i cells + ! loop ;
: sort 7 1 do
    idx i cells + @ ( key )
    i begin dup 0> while
      dup 1- cells idx + @ over rot-less? ( key j less )
      0= if leave then
      dup 1- cells idx + @ over cells idx + !
      1-
    repeat
    cells idx + !
  loop ;
: show 7 0 do idx i cells + @ 6 + 7 mod ch@ emit loop cr ;
init sort show
