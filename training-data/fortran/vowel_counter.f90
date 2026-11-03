program vowel_counter
  implicit none
  character(len=*), parameter :: text = "education is beautiful"
  character(len=5), parameter :: vowels = "aeiou"
  integer :: i, j, n

  do j = 1, 5
     n = 0
     do i = 1, len(text)
        if (text(i:i) == vowels(j:j)) n = n + 1
     end do
     write (*, '(a, "=", i0, 1x)', advance='no') vowels(j:j), n
  end do
  print *
end program vowel_counter
