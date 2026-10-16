program mod_modulo_demo
    implicit none
    integer :: a, b

    do a = -7, 7, 7
        do b = 3, 3
            print '(a,i3,a,i2,a,i3,a,i3)', 'a=', a, ' b=', b, '  mod=', mod(a, b), '  modulo=', modulo(a, b)
        end do
    end do
    print *, -7 / 2, floor(-7.0 / 2.0)
    print *, mod(-7.5, 2.0), modulo(-7.5, 2.0)
end program mod_modulo_demo
