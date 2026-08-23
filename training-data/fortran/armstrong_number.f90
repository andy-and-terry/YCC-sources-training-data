function is_armstrong(n) result(res)
    integer, intent(in) :: n
    logical :: res
    integer :: num, digit, num_digits, total, temp

    num = n
    num_digits = 0
    temp = n
    do while (temp > 0)
        num_digits = num_digits + 1
        temp = temp / 10
    end do

    total = 0
    do while (num > 0)
        digit = mod(num, 10)
        total = total + digit ** num_digits
        num = num / 10
    end do

    res = (total == n)
end function is_armstrong

program main
    implicit none
    logical :: is_armstrong
    print *, is_armstrong(153)
    print *, is_armstrong(154)
end program main
