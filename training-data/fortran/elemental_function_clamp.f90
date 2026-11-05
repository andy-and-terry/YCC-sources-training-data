program elemental_function_clamp
    implicit none
    print *, clamp([-5, 3, 12], 0, 10)
contains
    elemental integer function clamp(x, lo, hi)
        integer, intent(in) :: x, lo, hi
        clamp = max(lo, min(hi, x))
    end function clamp
end program elemental_function_clamp
