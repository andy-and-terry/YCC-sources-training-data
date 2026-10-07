module person_mod
    implicit none
    type :: person
        character(len=10) :: name
        integer :: age
    end type person
end module person_mod

program main
    use person_mod
    implicit none
    type(person) :: people(4)
    type(person) :: temp
    integer :: i, j

    people(1) = person('Alice', 30)
    people(2) = person('Bob', 25)
    people(3) = person('Carol', 35)
    people(4) = person('Dan', 20)

    do i = 1, size(people) - 1
        do j = 1, size(people) - i
            if (people(j)%age > people(j + 1)%age) then
                temp = people(j)
                people(j) = people(j + 1)
                people(j + 1) = temp
            end if
        end do
    end do

    do i = 1, size(people)
        print *, trim(people(i)%name), people(i)%age
    end do
end program main
