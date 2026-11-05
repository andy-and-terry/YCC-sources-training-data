module counter_mod
    implicit none
    type :: counter
        integer :: n = 0
    contains
        procedure :: bump
    end type counter
contains
    subroutine bump(self)
        class(counter), intent(inout) :: self
        self%n = self%n + 1
    end subroutine bump
end module counter_mod

program use_counter
    use counter_mod
    type(counter) :: c
    call c%bump()
    call c%bump()
    print *, c%n
end program use_counter
