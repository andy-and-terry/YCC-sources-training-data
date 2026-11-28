program lyndon_factorization
  implicit none
  character(len=6) :: s = "banana"
  integer :: i, j, k, n
  n = len(s)
  i = 1
  do while (i <= n)
     j = i + 1
     k = i
     do while (j <= n)
        if (s(k:k) > s(j:j)) exit
        if (s(k:k) < s(j:j)) then
           k = i
        else
           k = k + 1
        end if
        j = j + 1
     end do
     do while (i <= k)
        print '(a)', s(i:i + j - k - 1)
        i = i + j - k
     end do
  end do
end program lyndon_factorization
