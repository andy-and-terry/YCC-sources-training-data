module catalan_numbers_mod
    implicit none
contains
    subroutine compute_catalan(n, catalan)
        integer, intent(in) :: n
        integer(kind=8), intent(out) :: catalan(0:n)
        integer :: i, j
        catalan(0) = 1
        do i = 1, n
            catalan(i) = 0
            do j = 0, i - 1
                catalan(i) = catalan(i) + catalan(j) * catalan(i - 1 - j)
            end do
        end do
    end subroutine compute_catalan
end module catalan_numbers_mod

program main
    use catalan_numbers_mod
    implicit none
    integer, parameter :: n = 10
    integer(kind=8) :: catalan(0:n)

    call compute_catalan(n, catalan)
    print *, catalan
end program main
