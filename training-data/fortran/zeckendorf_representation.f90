! Zeckendorf representation: greedy sum of non-consecutive Fibonacci numbers.
program zeckendorf_representation
    implicit none
    integer :: fib(40), parts(40), k, i, cnt, remaining

    fib(1) = 1
    fib(2) = 2
    k = 2
    do while (fib(k) + fib(k - 1) <= 100)
        fib(k + 1) = fib(k) + fib(k - 1)
        k = k + 1
    end do

    remaining = 100
    cnt = 0
    do i = k, 1, -1
        if (fib(i) <= remaining) then
            cnt = cnt + 1
            parts(cnt) = fib(i)
            remaining = remaining - fib(i)
        end if
    end do

    write(*, '(*(I0,:,1X))') parts(1:cnt)
end program zeckendorf_representation
