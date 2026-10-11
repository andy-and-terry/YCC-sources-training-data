module resource_mod
    implicit none
    type :: resource
        integer :: id = 0
    contains
        final :: release
    end type resource
contains
    subroutine release(r)
        type(resource), intent(inout) :: r
        print *, 'releasing resource', r%id
    end subroutine release
end module resource_mod

program final_destructor_demo
    use resource_mod
    implicit none
    type(resource), allocatable :: r

    allocate (r)
    r%id = 7
    print *, 'allocated'
    deallocate (r)
    print *, 'done'
end program final_destructor_demo
