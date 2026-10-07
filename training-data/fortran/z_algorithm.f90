module z_algorithm_mod
    implicit none
contains
    subroutine z_array(s, n, z)
        integer, intent(in) :: n
        character(len=n), intent(in) :: s
        integer, intent(out) :: z(n)
        integer :: l, r, i, zi
        z = 0
        l = 1
        r = 1
        do i = 2, n
            zi = 0
            if (i < r) zi = min(r - i, z(i - l + 1))
            do while (i + zi <= n .and. s(zi + 1:zi + 1) == s(i + zi:i + zi))
                zi = zi + 1
            end do
            z(i) = zi
            if (i + zi > r) then
                l = i
                r = i + zi
            end if
        end do
    end subroutine z_array
end module z_algorithm_mod

program main
    use z_algorithm_mod
    implicit none
    character(len=19) :: s = "aabxaabxcaabxaabxay"
    integer :: z(19)

    call z_array(s, 19, z)
    print *, z
end program main
