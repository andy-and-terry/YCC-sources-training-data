module trie_mod
    implicit none

    type :: child_ptr
        type(trie_node), pointer :: p => null()
    end type child_ptr

    type :: trie_node
        type(child_ptr) :: children(26)
        logical :: is_end = .false.
    end type trie_node
contains
    function new_node() result(node)
        type(trie_node), pointer :: node
        allocate(node)
    end function new_node

    subroutine insert(root, word)
        type(trie_node), pointer, intent(inout) :: root
        character(len=*), intent(in) :: word
        type(trie_node), pointer :: cur
        integer :: i, idx
        cur => root
        do i = 1, len_trim(word)
            idx = ichar(word(i:i)) - ichar('a') + 1
            if (.not. associated(cur%children(idx)%p)) then
                cur%children(idx)%p => new_node()
            end if
            cur => cur%children(idx)%p
        end do
        cur%is_end = .true.
    end subroutine insert

    function contains_word(root, word) result(found)
        type(trie_node), pointer, intent(in) :: root
        character(len=*), intent(in) :: word
        logical :: found
        type(trie_node), pointer :: cur
        integer :: i, idx
        cur => root
        do i = 1, len_trim(word)
            idx = ichar(word(i:i)) - ichar('a') + 1
            if (.not. associated(cur%children(idx)%p)) then
                found = .false.
                return
            end if
            cur => cur%children(idx)%p
        end do
        found = cur%is_end
    end function contains_word
end module trie_mod

program main
    use trie_mod
    implicit none
    type(trie_node), pointer :: root

    root => new_node()
    call insert(root, 'cat')
    call insert(root, 'car')
    call insert(root, 'dog')

    print *, contains_word(root, 'cat')
    print *, contains_word(root, 'ca')
    print *, contains_word(root, 'dog')
end program main
