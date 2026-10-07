program internal_file_parse_demo
    implicit none
    character(len=50) :: line
    integer :: id
    real :: price
    character(len=6) :: item

    write(line, '(I4, 1X, A6, 1X, F6.2)') 42, 'widget', 9.99
    print *, trim(line)

    read(line, '(I4, 1X, A6, 1X, F6.2)') id, item, price
    print *, id, trim(item), price
end program internal_file_parse_demo
