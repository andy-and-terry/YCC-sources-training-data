program case_demo
  implicit none
  integer :: n
  do n = 0, 25, 8
    select case (n)
    case (:9);   print *, n, 'small'
    case (10:19); print *, n, 'medium'
    case default; print *, n, 'large'
    end select
  end do
end program case_demo
