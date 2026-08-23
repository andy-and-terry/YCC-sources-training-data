function is_anagram(a, b) result(res)
    character(len=*), intent(in) :: a, b
    logical :: res
    character(len=len(a)) :: sorted_a
    character(len=len(b)) :: sorted_b
    character :: tmp
    integer :: i, j

    sorted_a = a
    sorted_b = b

    do i = 1, len(sorted_a) - 1
        do j = i + 1, len(sorted_a)
            if (sorted_a(i:i) > sorted_a(j:j)) then
                tmp = sorted_a(i:i)
                sorted_a(i:i) = sorted_a(j:j)
                sorted_a(j:j) = tmp
            end if
        end do
    end do

    do i = 1, len(sorted_b) - 1
        do j = i + 1, len(sorted_b)
            if (sorted_b(i:i) > sorted_b(j:j)) then
                tmp = sorted_b(i:i)
                sorted_b(i:i) = sorted_b(j:j)
                sorted_b(j:j) = tmp
            end if
        end do
    end do

    res = (sorted_a == sorted_b)
end function is_anagram

program main
    implicit none
    logical :: is_anagram
    print *, is_anagram('listen', 'silent')
    print *, is_anagram('hello', 'world')
end program main
