module animals
    implicit none

    type, abstract :: animal
    contains
        procedure(speak_iface), deferred :: speak
    end type animal

    abstract interface
        function speak_iface(self) result(sound)
            import :: animal
            class(animal), intent(in) :: self
            character(len=:), allocatable :: sound
        end function speak_iface
    end interface

    type, extends(animal) :: dog
    contains
        procedure :: speak => dog_speak
    end type dog

    type, extends(animal) :: cat
    contains
        procedure :: speak => cat_speak
    end type cat

contains

    function dog_speak(self) result(sound)
        class(dog), intent(in) :: self
        character(len=:), allocatable :: sound
        sound = "Woof"
    end function dog_speak

    function cat_speak(self) result(sound)
        class(cat), intent(in) :: self
        character(len=:), allocatable :: sound
        sound = "Meow"
    end function cat_speak

end module animals

program abstract_type_demo
    use animals
    implicit none
    type(dog) :: d
    type(cat) :: c

    print '(A)', d%speak()
    print '(A)', c%speak()
end program abstract_type_demo
