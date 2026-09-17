module trie_mod
    implicit none
    integer, parameter :: max_nodes = 100

    type :: trie_type
        integer :: children(max_nodes, 26) = 0
        logical :: is_word(max_nodes) = .false.
        integer :: node_count = 1
    end type trie_type
contains
    subroutine trie_insert(t, word)
        type(trie_type), intent(inout) :: t
        character(len=*), intent(in) :: word
        integer :: node, i, c

        node = 1
        do i = 1, len_trim(word)
            c = iachar(word(i:i)) - iachar('a') + 1
            if (t%children(node, c) == 0) then
                t%node_count = t%node_count + 1
                t%children(node, c) = t%node_count
            end if
            node = t%children(node, c)
        end do
        t%is_word(node) = .true.
    end subroutine trie_insert

    logical function trie_search(t, word) result(found)
        type(trie_type), intent(in) :: t
        character(len=*), intent(in) :: word
        integer :: node, i, c

        node = 1
        found = .true.
        do i = 1, len_trim(word)
            c = iachar(word(i:i)) - iachar('a') + 1
            if (t%children(node, c) == 0) then
                found = .false.
                return
            end if
            node = t%children(node, c)
        end do
        found = t%is_word(node)
    end function trie_search
end module trie_mod

program main
    use trie_mod
    implicit none
    type(trie_type) :: t

    call trie_insert(t, "cat")
    call trie_insert(t, "car")
    call trie_insert(t, "dog")

    print *, trie_search(t, "cat")
    print *, trie_search(t, "ca")
    print *, trie_search(t, "dog")
end program main
