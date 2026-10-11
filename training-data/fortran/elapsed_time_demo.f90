program elapsed_time_demo
    implicit none
    integer :: t0, t1, rate, i
    real :: c0, c1
    double precision :: s

    call system_clock(t0, rate)
    call cpu_time(c0)
    s = 0.0d0
    do i = 1, 2000000
        s = s + sqrt(dble(i))
    end do
    call cpu_time(c1)
    call system_clock(t1)

    print *, 'sum computed:', s > 0.0d0
    print *, 'cpu time nonnegative:', c1 - c0 >= 0.0
    print *, 'wall time nonnegative:', real(t1 - t0) / real(rate) >= 0.0
end program elapsed_time_demo
