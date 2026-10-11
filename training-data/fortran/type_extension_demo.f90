module animals
    implicit none
    type :: animal
        character(len=10) :: name = 'unknown'
    end type animal
    type, extends(animal) :: dog
        logical :: barks = .true.
    end type dog
end module animals

program type_extension_demo
    use animals
    implicit none
    type(dog) :: d

    d%name = 'Rex'
    d%animal%name = 'Rexy'
    print *, trim(d%name), d%barks
    print *, trim(d%animal%name)
end program type_extension_demo
