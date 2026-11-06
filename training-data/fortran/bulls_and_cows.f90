! Bulls and Cows scoring for equal-length digit strings.
program bulls_and_cows
  implicit none
  integer :: bulls, cows
  call score('1807', '7810', bulls, cows)
  print '(I0,A,I0,A)', bulls, ' bull(s), ', cows, ' cow(s)'
contains
  subroutine score(secret, guess, bulls, cows)
    character(len=*), intent(in) :: secret, guess
    integer, intent(out) :: bulls, cows
    integer :: sc(0:9), gc(0:9), i, d
    sc = 0
    gc = 0
    bulls = 0
    do i = 1, len(secret)
      if (secret(i:i) == guess(i:i)) then
        bulls = bulls + 1
      else
        d = iachar(secret(i:i)) - iachar('0'); sc(d) = sc(d) + 1
        d = iachar(guess(i:i)) - iachar('0'); gc(d) = gc(d) + 1
      end if
    end do
    cows = sum(min(sc, gc))
  end subroutine score
end program bulls_and_cows
