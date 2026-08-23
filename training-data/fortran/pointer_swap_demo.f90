subroutine swap_pointers(a, b)
    integer, pointer, intent(inout) :: a, b
    integer, pointer :: tmp
    tmp => a
    a => b
    b => tmp
end subroutine swap_pointers

program main
    implicit none
    integer, target :: x = 1, y = 2
    integer, pointer :: px, py
    px => x
    py => y
    call swap_pointers(px, py)
    print *, px, py
end program main
