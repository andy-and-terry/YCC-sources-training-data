program select_case_ex
  implicit none
  integer :: n
  do n = 1, 6, 2
     select case (n)
     case (1)
        print *, 'one'
     case (2:4)
        print *, 'two to four'
     case default
        print *, 'many'
     end select
  end do
end program select_case_ex
