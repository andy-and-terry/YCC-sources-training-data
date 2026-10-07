module rectangle_mod
    implicit none
    type :: rectangle
        real :: width, height
    end type rectangle

    interface
        module function rectangle_area(r) result(res)
            type(rectangle), intent(in) :: r
            real :: res
        end function rectangle_area
    end interface
end module rectangle_mod

submodule (rectangle_mod) rectangle_mod_impl
contains
    module function rectangle_area(r) result(res)
        type(rectangle), intent(in) :: r
        real :: res
        res = r%width * r%height
    end function rectangle_area
end submodule rectangle_mod_impl

program submodule_demo
    use rectangle_mod
    implicit none
    type(rectangle) :: r
    r%width = 3.0
    r%height = 4.0
    print *, rectangle_area(r)
end program submodule_demo
