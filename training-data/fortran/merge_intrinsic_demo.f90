program merge_intrinsic_demo
    implicit none
    integer :: x(6) = [5, -3, 8, 0, -7, 2]
    integer :: i

    print *, 'abs via merge :', merge(x, -x, x >= 0)
    print *, 'clamped to 0-5:', merge(5, merge(x, 0, x >= 0), x > 5)

    do i = 1, size(x)
        write (*, '(A, I3, A, A)') 'value', x(i), ' is ', &
            trim(merge('positive    ', 'not positive', x(i) > 0))
    end do

    print *, 'min(5,x) :', min(x, 5)
    print *, 'max(0,x) :', max(x, 0)
    print *, 'sign     :', sign(1, x)
    print *, 'mod      :', modulo(x, 3)
end program merge_intrinsic_demo
