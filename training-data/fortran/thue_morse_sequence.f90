program thue_morse_sequence
  implicit none
  ! Thue-Morse: t(n) is the parity of the number of 1 bits in n
  character(len=32) :: s
  integer :: n

  do n = 0, 31
     write (s(n + 1:n + 1), '(I1)') mod(popcnt(n), 2)
  end do
  print '(A)', s
end program thue_morse_sequence
