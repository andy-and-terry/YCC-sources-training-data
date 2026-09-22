program block_construct_demo
    implicit none
    integer :: x

    x = 5
    print *, 'before block, x =', x

    block
        integer :: y
        y = x * 2
        print *, 'inside block, y =', y
    end block

    print *, 'after block, x =', x
end program block_construct_demo
