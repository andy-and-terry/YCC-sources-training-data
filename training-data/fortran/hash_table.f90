module hash_table_mod
    implicit none
    integer, parameter :: table_size = 7

    type :: entry
        character(len=20) :: key
        integer :: value
        type(entry), pointer :: next => null()
    end type entry

    type :: bucket_ptr
        type(entry), pointer :: head => null()
    end type bucket_ptr

    type(bucket_ptr) :: table(table_size)
contains
    function hash(key) result(h)
        character(len=*), intent(in) :: key
        integer :: h, i
        h = 0
        do i = 1, len_trim(key)
            h = mod(h * 31 + ichar(key(i:i)), table_size)
        end do
        h = h + 1
    end function hash

    subroutine put(key, value)
        character(len=*), intent(in) :: key
        integer, intent(in) :: value
        integer :: idx
        type(entry), pointer :: new_entry, cur
        idx = hash(key)
        cur => table(idx)%head
        do while (associated(cur))
            if (trim(cur%key) == trim(key)) then
                cur%value = value
                return
            end if
            cur => cur%next
        end do
        allocate(new_entry)
        new_entry%key = key
        new_entry%value = value
        new_entry%next => table(idx)%head
        table(idx)%head => new_entry
    end subroutine put

    function get(key, found) result(value)
        character(len=*), intent(in) :: key
        logical, intent(out) :: found
        integer :: value, idx
        type(entry), pointer :: cur
        idx = hash(key)
        cur => table(idx)%head
        found = .false.
        value = 0
        do while (associated(cur))
            if (trim(cur%key) == trim(key)) then
                value = cur%value
                found = .true.
                return
            end if
            cur => cur%next
        end do
    end function get
end module hash_table_mod

program main
    use hash_table_mod
    implicit none
    logical :: found
    integer :: v

    call put('alice', 30)
    call put('bob', 25)
    call put('carol', 35)

    v = get('bob', found)
    print *, found, v
    v = get('dave', found)
    print *, found, v
end program main
