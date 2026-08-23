module array_queue_mod
    implicit none
    type :: int_queue
        integer :: items(100)
        integer :: front = 1
        integer :: back = 0
        integer :: size = 0
    contains
        procedure :: enqueue => queue_enqueue
        procedure :: dequeue => queue_dequeue
    end type int_queue
contains
    subroutine queue_enqueue(this, value)
        class(int_queue), intent(inout) :: this
        integer, intent(in) :: value
        this%back = this%back + 1
        this%items(this%back) = value
        this%size = this%size + 1
    end subroutine queue_enqueue

    function queue_dequeue(this) result(value)
        class(int_queue), intent(inout) :: this
        integer :: value
        value = this%items(this%front)
        this%front = this%front + 1
        this%size = this%size - 1
    end function queue_dequeue
end module array_queue_mod

program main
    use array_queue_mod
    implicit none
    type(int_queue) :: q
    call q%enqueue(1)
    call q%enqueue(2)
    call q%enqueue(3)
    print *, q%dequeue()
    print *, q%dequeue()
end program main
