module circular_buffer_mod
    implicit none
    type :: circ_buffer
        integer :: data(3)
        integer :: capacity = 3
        integer :: size = 0
        integer :: start = 0
    contains
        procedure :: push => buffer_push
    end type circ_buffer
contains
    subroutine buffer_push(this, value)
        class(circ_buffer), intent(inout) :: this
        integer, intent(in) :: value
        integer :: idx
        idx = mod(this%start + this%size, this%capacity) + 1
        this%data(idx) = value
        if (this%size < this%capacity) then
            this%size = this%size + 1
        else
            this%start = mod(this%start + 1, this%capacity)
        end if
    end subroutine buffer_push
end module circular_buffer_mod

program main
    use circular_buffer_mod
    implicit none
    type(circ_buffer) :: buf
    integer :: i
    integer :: values(5) = [1, 2, 3, 4, 5]
    do i = 1, 5
        call buf%push(values(i))
    end do
    print *, buf%data
end program main
