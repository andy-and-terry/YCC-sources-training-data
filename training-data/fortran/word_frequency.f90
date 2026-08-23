program word_frequency
    implicit none
    character(len=100) :: text = 'the quick brown fox the lazy fox'
    character(len=20) :: words(20)
    integer :: counts(20)
    integer :: n_words, i, j
    integer :: pos, start
    logical :: found

    n_words = 0
    start = 1
    do i = 1, len_trim(text) + 1
        if (i > len_trim(text) .or. text(i:i) == ' ') then
            if (i > start) then
                n_words = n_words + 1
                words(n_words) = text(start:i - 1)
                counts(n_words) = 0
            end if
            start = i + 1
        end if
    end do

    do i = 1, n_words
        do j = 1, n_words
            if (words(i) == words(j)) counts(i) = counts(i) + 1
        end do
    end do

    do i = 1, n_words
        found = .false.
        do j = 1, i - 1
            if (words(j) == words(i)) found = .true.
        end do
        if (.not. found) print *, trim(words(i)), counts(i)
    end do
end program word_frequency
