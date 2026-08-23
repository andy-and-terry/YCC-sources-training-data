function lcs_length(a, b) result(len_result)
    character(len=*), intent(in) :: a, b
    integer :: len_result
    integer :: m, n, i, j
    integer, allocatable :: table(:, :)

    m = len(a)
    n = len(b)
    allocate(table(0:m, 0:n))
    table = 0

    do i = 1, m
        do j = 1, n
            if (a(i:i) == b(j:j)) then
                table(i, j) = table(i - 1, j - 1) + 1
            else
                table(i, j) = max(table(i - 1, j), table(i, j - 1))
            end if
        end do
    end do

    len_result = table(m, n)
end function lcs_length

program main
    implicit none
    integer :: lcs_length
    print *, lcs_length('abcde', 'ace')
end program main
