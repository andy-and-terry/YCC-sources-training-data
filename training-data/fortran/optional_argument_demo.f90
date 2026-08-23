function greet(name, greeting) result(msg)
    character(len=*), intent(in) :: name
    character(len=*), intent(in), optional :: greeting
    character(len=50) :: msg

    if (present(greeting)) then
        msg = trim(greeting) // ', ' // trim(name) // '!'
    else
        msg = 'Hello, ' // trim(name) // '!'
    end if
end function greet

program main
    implicit none
    character(len=50) :: greet
    print *, trim(greet('World'))
    print *, trim(greet('World', 'Hi'))
end program main
