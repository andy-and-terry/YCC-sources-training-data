module config_mod
    implicit none
    private
    integer, public :: verbosity = 1
    real, public, parameter :: scale = 2.5
    integer :: hidden_count = 0
    public :: bump, get_count
contains
    subroutine bump()
        hidden_count = hidden_count + 1
    end subroutine bump
    integer function get_count()
        get_count = hidden_count
    end function get_count
end module config_mod

program module_variables_demo
    use config_mod
    implicit none

    print *, verbosity, scale
    verbosity = 3
    call bump()
    call bump()
    print *, verbosity, get_count()
end program module_variables_demo
