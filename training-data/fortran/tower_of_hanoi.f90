recursive subroutine hanoi(n, from_peg, to_peg, via_peg)
    integer, intent(in) :: n
    character(len=1), intent(in) :: from_peg, to_peg, via_peg

    if (n == 0) return
    call hanoi(n - 1, from_peg, via_peg, to_peg)
    write(*, '(A, I0, A, A, A, A)') 'Move disk ', n, ' from ', from_peg, ' to ', to_peg
    call hanoi(n - 1, via_peg, to_peg, from_peg)
end subroutine hanoi

program main
    implicit none
    call hanoi(3, 'A', 'C', 'B')
end program main
