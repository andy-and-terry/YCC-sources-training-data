program coarray_demo
    implicit none
    integer :: value[*]
    integer :: total[*]
    integer :: img, num_imgs, i

    img = this_image()
    num_imgs = num_images()

    value = img * 10
    sync all

    if (img == 1) then
        total = 0
        do i = 1, num_imgs
            total = total + value[i]
        end do
        print *, "sum across images:", total
    end if

    sync all
    print *, "image", img, "of", num_imgs, "holds value", value
end program coarray_demo
