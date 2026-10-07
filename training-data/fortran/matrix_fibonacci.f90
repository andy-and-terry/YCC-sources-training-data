program matrix_fibonacci
    implicit none
    integer, parameter :: i8 = selected_int_kind(18)
    integer :: n

    do n = 1, 5
        print '(a, i0, a, i0)', 'fib(', n * 15 - 5, ') = ', fib(n * 15 - 5)
    end do

contains

    function fib(n) result(f)
        integer, intent(in) :: n
        integer(i8) :: f
        integer(i8) :: result_m(2, 2), base(2, 2)
        integer :: k

        result_m = reshape([1_i8, 0_i8, 0_i8, 1_i8], [2, 2])
        base = reshape([1_i8, 1_i8, 1_i8, 0_i8], [2, 2])
        k = n
        do while (k > 0)
            if (iand(k, 1) == 1) result_m = matmul(result_m, base)
            base = matmul(base, base)
            k = ishft(k, -1)
        end do
        f = result_m(1, 2)
    end function fib

end program matrix_fibonacci
