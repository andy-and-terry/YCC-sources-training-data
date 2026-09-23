program temperature_converter_menu
    implicit none
    integer :: mode
    real :: temp_in, temp_out
    character(len=40) :: result_line

    do mode = 1, 3
        select case (mode)
        case (1)
            temp_in = 0.0
            temp_out = temp_in * 9.0 / 5.0 + 32.0
            write(result_line, '(A, F6.2, A, F6.2)') 'C ', temp_in, ' -> F ', temp_out
        case (2)
            temp_in = 212.0
            temp_out = (temp_in - 32.0) * 5.0 / 9.0
            write(result_line, '(A, F6.2, A, F6.2)') 'F ', temp_in, ' -> C ', temp_out
        case (3)
            temp_in = 25.0
            temp_out = temp_in + 273.15
            write(result_line, '(A, F6.2, A, F6.2)') 'C ', temp_in, ' -> K ', temp_out
        case default
            result_line = 'unknown mode'
        end select
        print *, trim(result_line)
    end do
end program temperature_converter_menu
