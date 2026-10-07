program caesar_cipher
    implicit none
    character(len=13) :: msg = "Hello, World!"
    character(len=13) :: enc, dec

    enc = shift_text(msg, 3)
    dec = shift_text(enc, -3)
    print *, enc
    print *, dec

contains

    function shift_text(text, k) result(out)
        character(len=*), intent(in) :: text
        integer, intent(in) :: k
        character(len=len(text)) :: out
        integer :: i, c

        do i = 1, len(text)
            c = iachar(text(i:i))
            if (c >= iachar('a') .and. c <= iachar('z')) then
                c = modulo(c - iachar('a') + k, 26) + iachar('a')
            else if (c >= iachar('A') .and. c <= iachar('Z')) then
                c = modulo(c - iachar('A') + k, 26) + iachar('A')
            end if
            out(i:i) = achar(c)
        end do
    end function shift_text

end program caesar_cipher
