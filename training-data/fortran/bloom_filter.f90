module bloom_filter_mod
    implicit none
    integer, parameter :: filter_size = 32
    logical :: bits(filter_size) = .false.
contains
    integer function hash1(value)
        integer, intent(in) :: value
        hash1 = mod(value * 7 + 3, filter_size) + 1
    end function hash1

    integer function hash2(value)
        integer, intent(in) :: value
        hash2 = mod(value * 13 + 11, filter_size) + 1
    end function hash2

    subroutine bloom_add(value)
        integer, intent(in) :: value
        bits(hash1(value)) = .true.
        bits(hash2(value)) = .true.
    end subroutine bloom_add

    logical function might_contain(value)
        integer, intent(in) :: value
        might_contain = bits(hash1(value)) .and. bits(hash2(value))
    end function might_contain
end module bloom_filter_mod

program main
    use bloom_filter_mod
    implicit none
    call bloom_add(10)
    call bloom_add(25)
    print *, might_contain(10)
    print *, might_contain(99)
end program main
