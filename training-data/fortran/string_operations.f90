program string_operations
    implicit none
    character(len=30) :: str = 'Hello, Fortran World!'

    print *, trim(str)
    print *, len_trim(str)
    print *, index(str, 'Fortran')
    print *, str(1:5)
end program string_operations
