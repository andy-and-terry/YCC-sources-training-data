program pythagorean_triples_search
    implicit none
    integer :: a, b, c, count

    count = 0
    do a = 1, 30
        do b = a, 30
            c = nint(sqrt(real(a * a + b * b)))
            if (c <= 30 .and. c * c == a * a + b * b) then
                print '(3i4)', a, b, c
                count = count + 1
            end if
        end do
    end do
    print *, count, 'triples'
end program pythagorean_triples_search
