module lru_cache_mod
    implicit none
    integer, parameter :: capacity = 3

    type :: lru_cache
        integer :: keys(capacity) = -1
        integer :: values(capacity) = 0
        integer :: order(capacity) = -1   ! order(1) = most recently used
        integer :: count = 0
    contains
        procedure :: get => cache_get
        procedure :: put => cache_put
    end type lru_cache
contains
    subroutine touch(this, key)
        class(lru_cache), intent(inout) :: this
        integer, intent(in) :: key
        integer :: i, j
        integer :: new_order(capacity)
        new_order = -1
        new_order(1) = key
        j = 1
        do i = 1, capacity
            if (this%order(i) /= key .and. this%order(i) /= -1) then
                j = j + 1
                new_order(j) = this%order(i)
            end if
        end do
        this%order = new_order
    end subroutine touch

    function find_slot(this, key) result(slot)
        class(lru_cache), intent(in) :: this
        integer, intent(in) :: key
        integer :: slot, i
        slot = -1
        do i = 1, this%count
            if (this%keys(i) == key) then
                slot = i
                return
            end if
        end do
    end function find_slot

    function cache_get(this, key, found) result(value)
        class(lru_cache), intent(inout) :: this
        integer, intent(in) :: key
        logical, intent(out) :: found
        integer :: value, slot
        slot = find_slot(this, key)
        if (slot == -1) then
            found = .false.
            value = -1
            return
        end if
        found = .true.
        value = this%values(slot)
        call touch(this, key)
    end function cache_get

    subroutine cache_put(this, key, value)
        class(lru_cache), intent(inout) :: this
        integer, intent(in) :: key, value
        integer :: slot, evict_key, i

        slot = find_slot(this, key)
        if (slot /= -1) then
            this%values(slot) = value
            call touch(this, key)
            return
        end if

        if (this%count < capacity) then
            this%count = this%count + 1
            this%keys(this%count) = key
            this%values(this%count) = value
            call touch(this, key)
            return
        end if

        ! evict the least recently used entry (last real key in order)
        evict_key = this%order(capacity)
        do i = 1, capacity
            if (this%order(i) == evict_key) this%order(i) = -1
        end do
        slot = find_slot(this, evict_key)
        this%keys(slot) = key
        this%values(slot) = value
        call touch(this, key)
    end subroutine cache_put
end module lru_cache_mod

program main
    use lru_cache_mod
    implicit none
    type(lru_cache) :: cache
    integer :: v
    logical :: found

    call cache%put(1, 100)
    call cache%put(2, 200)
    call cache%put(3, 300)
    v = cache%get(1, found)
    print *, found, v

    call cache%put(4, 400)   ! evicts least recently used (key 2)
    v = cache%get(2, found)
    print *, found, v
end program main
