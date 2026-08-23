function edit_distance(a, b) result(dist)
    character(len=*), intent(in) :: a, b
    integer :: dist
    integer :: m, n, i, j, cost
    integer, allocatable :: table(:, :)

    m = len(a)
    n = len(b)
    allocate(table(0:m, 0:n))

    do i = 0, m
        table(i, 0) = i
    end do
    do j = 0, n
        table(0, j) = j
    end do

    do i = 1, m
        do j = 1, n
            if (a(i:i) == b(j:j)) then
                cost = 0
            else
                cost = 1
            end if
            table(i, j) = min(table(i - 1, j) + 1, table(i, j - 1) + 1, table(i - 1, j - 1) + cost)
        end do
    end do

    dist = table(m, n)
end function edit_distance

program main
    implicit none
    integer :: edit_distance
    print *, edit_distance('kitten', 'sitting')
end program main
