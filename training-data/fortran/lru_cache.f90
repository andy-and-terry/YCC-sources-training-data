module lru_cache_mod
    implicit none
    integer, parameter :: capacity = 3
    integer :: keys(capacity) = -1
    integer :: values(capacity) = 0
    integer :: recency(capacity) = 0
    integer :: clock = 0
contains
    subroutine cache_put(key, value)
        integer, intent(in) :: key, value
        integer :: i, slot, oldest, oldest_idx
        clock = clock + 1
        do i = 1, capacity
            if (keys(i) == key) then
                values(i) = value
                recency(i) = clock
                return
            end if
        end do
        slot = -1
        do i = 1, capacity
            if (keys(i) == -1) then
                slot = i
                exit
            end if
        end do
        if (slot == -1) then
            oldest = recency(1)
            oldest_idx = 1
            do i = 2, capacity
                if (recency(i) < oldest) then
                    oldest = recency(i)
                    oldest_idx = i
                end if
            end do
            slot = oldest_idx
        end if
        keys(slot) = key
        values(slot) = value
        recency(slot) = clock
    end subroutine cache_put

    logical function cache_get(key, value)
        integer, intent(in) :: key
        integer, intent(out) :: value
        integer :: i
        clock = clock + 1
        cache_get = .false.
        do i = 1, capacity
            if (keys(i) == key) then
                value = values(i)
                recency(i) = clock
                cache_get = .true.
                return
            end if
        end do
    end function cache_get
end module lru_cache_mod

program main
    use lru_cache_mod
    implicit none
    integer :: v
    logical :: found

    call cache_put(1, 10)
    call cache_put(2, 20)
    call cache_put(3, 30)
    found = cache_get(1, v)
    call cache_put(4, 40)
    found = cache_get(2, v)
    print *, found
    found = cache_get(1, v)
    print *, v
end program main
