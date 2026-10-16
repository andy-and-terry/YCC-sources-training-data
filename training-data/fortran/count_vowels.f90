program count_vowels
    implicit none
    character(len=*), parameter :: s = 'Fortran Is Fun To Write'
    integer :: i, n

    n = 0
    do i = 1, len(s)
        if (index('aeiouAEIOU', s(i:i)) > 0) n = n + 1
    end do
    print *, 'vowels:', n
    print *, 'consonant letters:', count([(scan(s(i:i), 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ') > 0, i = 1, len(s))]) - n
end program count_vowels
