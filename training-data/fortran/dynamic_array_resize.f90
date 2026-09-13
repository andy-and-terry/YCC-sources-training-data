program dynamic_array_resize
    implicit none
    integer, allocatable :: arr(:)
    integer, allocatable :: temp(:)
    integer :: capacity, size, i

    capacity = 2
    size = 0
    allocate(arr(capacity))

    do i = 1, 10
        if (size == capacity) then
            capacity = capacity * 2
            allocate(temp(capacity))
            temp(1:size) = arr(1:size)
            call move_alloc(temp, arr)
        end if
        size = size + 1
        arr(size) = i * i
    end do

    print *, arr(1:size)
end program dynamic_array_resize
