module lru_cache_mod
    implicit none
    integer, parameter :: cache_cap = 3
    type :: lru_cache
        integer :: keys(cache_cap) = -1
        integer :: vals(cache_cap) = 0
        integer :: count = 0
    contains
        procedure :: put => lru_put
        procedure :: get => lru_get
    end type lru_cache
contains
    subroutine lru_touch(this, idx)
        class(lru_cache), intent(inout) :: this
        integer, intent(in) :: idx
        integer :: k, v, i
        k = this%keys(idx)
        v = this%vals(idx)
        do i = idx, 2, -1
            this%keys(i) = this%keys(i - 1)
            this%vals(i) = this%vals(i - 1)
        end do
        this%keys(1) = k
        this%vals(1) = v
    end subroutine lru_touch

    subroutine lru_put(this, key, val)
        class(lru_cache), intent(inout) :: this
        integer, intent(in) :: key, val
        integer :: i

        do i = 1, this%count
            if (this%keys(i) == key) then
                this%vals(i) = val
                call lru_touch(this, i)
                return
            end if
        end do

        if (this%count < cache_cap) then
            this%count = this%count + 1
        end if

        do i = this%count, 2, -1
            this%keys(i) = this%keys(i - 1)
            this%vals(i) = this%vals(i - 1)
        end do
        this%keys(1) = key
        this%vals(1) = val
    end subroutine lru_put

    function lru_get(this, key) result(val)
        class(lru_cache), intent(inout) :: this
        integer, intent(in) :: key
        integer :: val
        integer :: i

        val = -1
        do i = 1, this%count
            if (this%keys(i) == key) then
                val = this%vals(i)
                call lru_touch(this, i)
                return
            end if
        end do
    end function lru_get
end module lru_cache_mod

program main
    use lru_cache_mod
    implicit none
    type(lru_cache) :: c

    call c%put(1, 100)
    call c%put(2, 200)
    call c%put(3, 300)
    print *, c%get(1)
    call c%put(4, 400)
    print *, c%get(2)
    print *, c%get(3)
    print *, c%get(4)
end program main
