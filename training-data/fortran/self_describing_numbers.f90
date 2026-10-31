program self_describing_numbers
    implicit none
    character(len=5) :: values(4) = ['1210 ', '2020 ', '21200', '1211 ']
    integer :: i
    do i = 1, 4
        print '(A, 1X, L1)', trim(values(i)), is_self_describing(trim(values(i)))
    end do
contains
    logical function is_self_describing(s)
        character(len=*), intent(in) :: s
        integer :: k, j, count
        is_self_describing = .false.
        do k = 0, len(s) - 1
            count = 0
            do j = 1, len(s)
                if (s(j:j) == achar(iachar('0') + k)) count = count + 1
            end do
            if (count /= iachar(s(k+1:k+1)) - iachar('0')) return
        end do
        is_self_describing = .true.
    end function is_self_describing
end program self_describing_numbers
