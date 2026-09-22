program namelist_io_demo
    implicit none
    integer :: id
    real :: score
    character(len=20) :: name
    character(len=100) :: buffer
    namelist /person/ id, name, score

    id = 1
    name = 'Alice'
    score = 92.5

    write(buffer, nml=person)
    print *, trim(buffer)

    id = 0
    name = ''
    score = 0.0

    read(buffer, nml=person)
    print *, id, trim(name), score
end program namelist_io_demo
