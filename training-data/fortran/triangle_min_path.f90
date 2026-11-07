program triangle_min_path
  implicit none
  integer :: t(4, 4), dp(4), r, i
  t = 0
  t(1, 1) = 2
  t(2, 1:2) = [3, 4]
  t(3, 1:3) = [6, 5, 7]
  t(4, 1:4) = [4, 1, 8, 3]
  dp = t(4, :)
  do r = 3, 1, -1
    do i = 1, r
      dp(i) = t(r, i) + min(dp(i), dp(i + 1))
    end do
  end do
  print *, dp(1)  ! 11
end program triangle_min_path
