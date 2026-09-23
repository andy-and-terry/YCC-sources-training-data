program select_type_demo
    implicit none

    call describe(42)
    call describe(3.14)
    call describe('hello')
    call describe(.true.)

contains
    subroutine describe(value)
        class(*), intent(in) :: value

        select type (value)
        type is (integer)
            print *, 'integer:', value
        type is (real)
            print *, 'real:', value
        type is (character(len=*))
            print *, 'string:', value
        type is (logical)
            print *, 'logical:', value
        class default
            print *, 'unknown type'
        end select
    end subroutine describe
end program select_type_demo
