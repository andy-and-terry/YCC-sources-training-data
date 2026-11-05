module geometry
    implicit none
contains
    pure function circle_area(r) result(a)
        real, intent(in) :: r
        real :: a
        a = 3.14159265 * r * r
    end function circle_area
end module geometry

program use_geometry
    use geometry
    implicit none
    print '(f8.3)', circle_area(2.0)
end program use_geometry
