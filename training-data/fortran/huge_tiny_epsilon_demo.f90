program huge_tiny_epsilon_demo
    implicit none

    print *, 'int32 huge   :', huge(1)
    print *, 'int8  huge   :', huge(1_1)
    print *, 'real tiny    :', tiny(1.0)
    print *, 'real huge    :', huge(1.0)
    print *, 'real epsilon :', epsilon(1.0)
    print *, 'double eps   :', epsilon(1.0d0)
    print *, 'digits       :', digits(1.0), digits(1.0d0)
end program huge_tiny_epsilon_demo
