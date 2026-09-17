module priority_queue_mod
    implicit none
    type :: min_heap
        integer, allocatable :: items(:)
        integer :: n = 0
    contains
        procedure :: insert => heap_insert
        procedure :: extract_min => heap_extract_min
    end type min_heap
contains
    subroutine grow(this)
        type(min_heap), intent(inout) :: this
        integer, allocatable :: temp(:)
        allocate(temp(size(this%items) * 2))
        temp(1:this%n) = this%items(1:this%n)
        call move_alloc(temp, this%items)
    end subroutine grow

    subroutine heap_insert(this, value)
        class(min_heap), intent(inout) :: this
        integer, intent(in) :: value
        integer :: i, parent, temp
        if (.not. allocated(this%items)) allocate(this%items(10))
        if (this%n == size(this%items)) call grow(this)
        this%n = this%n + 1
        this%items(this%n) = value
        i = this%n
        do while (i > 1)
            parent = i / 2
            if (this%items(parent) <= this%items(i)) exit
            temp = this%items(parent)
            this%items(parent) = this%items(i)
            this%items(i) = temp
            i = parent
        end do
    end subroutine heap_insert

    function heap_extract_min(this) result(value)
        class(min_heap), intent(inout) :: this
        integer :: value, i, left, right, smallest, temp
        value = this%items(1)
        this%items(1) = this%items(this%n)
        this%n = this%n - 1
        i = 1
        do
            smallest = i
            left = 2 * i
            right = 2 * i + 1
            if (left <= this%n) then
                if (this%items(left) < this%items(smallest)) smallest = left
            end if
            if (right <= this%n) then
                if (this%items(right) < this%items(smallest)) smallest = right
            end if
            if (smallest == i) exit
            temp = this%items(i)
            this%items(i) = this%items(smallest)
            this%items(smallest) = temp
            i = smallest
        end do
    end function heap_extract_min
end module priority_queue_mod

program main
    use priority_queue_mod
    implicit none
    type(min_heap) :: pq
    call pq%insert(30)
    call pq%insert(10)
    call pq%insert(20)
    call pq%insert(5)
    print *, pq%extract_min()
    print *, pq%extract_min()
    print *, pq%extract_min()
    print *, pq%extract_min()
end program main
