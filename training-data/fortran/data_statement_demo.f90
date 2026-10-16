program data_statement_demo
    implicit none
    integer :: counts(5)
    real :: x, y
    character(len=5) :: name
    logical :: flag

    data counts /5 * 0/
    data x, y /1.5, -2.5/
    data name /'Fort'/
    data flag /.true./

    print *, counts
    print *, x, y
    print *, name, flag
end program data_statement_demo
