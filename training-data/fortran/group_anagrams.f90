module group_anagrams_mod
    implicit none
contains
    function sorted_chars(word) result(sorted)
        character(len=*), intent(in) :: word
        character(len=len(word)) :: sorted
        integer :: i, j
        character :: tmp
        sorted = word
        do i = 1, len(sorted) - 1
            do j = 1, len(sorted) - i
                if (sorted(j:j) > sorted(j + 1:j + 1)) then
                    tmp = sorted(j:j)
                    sorted(j:j) = sorted(j + 1:j + 1)
                    sorted(j + 1:j + 1) = tmp
                end if
            end do
        end do
    end function sorted_chars
end module group_anagrams_mod

program main
    use group_anagrams_mod
    implicit none
    integer, parameter :: n = 6
    character(len=3) :: words(n) = ["eat", "tea", "tan", "ate", "nat", "bat"]
    integer :: i, j

    do i = 1, n
        write (*, '(A)', advance='no') words(i) // " -> " // sorted_chars(words(i))
        do j = 1, n
            if (i /= j) then
                if (sorted_chars(words(i)) == sorted_chars(words(j))) then
                    write (*, '(A)', advance='no') " matches " // words(j)
                end if
            end if
        end do
        print *
    end do
end program main
