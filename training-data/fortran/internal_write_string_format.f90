program internal_write_string_format
    implicit none
    character(len=20) :: buf
    write (buf, '(a, i3, a, f5.1)') 'n=', 42, ' x=', 3.14159
    print *, trim(buf)
end program internal_write_string_format
