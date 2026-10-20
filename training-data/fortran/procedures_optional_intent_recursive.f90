module procs
    implicit none
contains
    recursive function fact(n) result(f)
        integer, intent(in) :: n
        integer(8) :: f
        if (n <= 1) then
            f = 1
        else
            f = n * fact(n - 1)
        end if
    end function fact

    subroutine stats(x, mean, sd, n)
        real, intent(in) :: x(:)
        real, intent(out) :: mean
        real, intent(out), optional :: sd
        integer, intent(out), optional :: n
        mean = sum(x) / size(x)
        if (present(sd)) sd = sqrt(sum((x - mean)**2) / size(x))
        if (present(n)) n = size(x)
    end subroutine stats

    elemental function clamp(x, lo, hi) result(r)
        real, intent(in) :: x, lo, hi
        real :: r
        r = min(max(x, lo), hi)
    end function clamp
end module procs

program procedures_optional_intent_recursive
    use procs
    implicit none
    real :: m, s
    integer :: n
    call stats([2.0, 4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0], m, s, n)
    print *, fact(15), m, s, n
    call stats([1.0, 2.0], m)
    print *, m, clamp([-1.0, 0.5, 3.0], 0.0, 1.0)
end program procedures_optional_intent_recursive
