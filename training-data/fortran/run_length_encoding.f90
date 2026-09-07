program run_length_encoding
    implicit none
    character(len=20) :: input = "aaabbbcccd"
    character(len=40) :: encoded
    character(len=20) :: decoded

    encoded = rle_encode(trim(input))
    print *, trim(encoded)

    decoded = rle_decode(trim(encoded))
    print *, trim(decoded)

contains

    function rle_encode(str) result(res)
        character(len=*), intent(in) :: str
        character(len=40) :: res
        integer :: i, count, n

        res = ""
        n = len(str)
        i = 1
        do while (i <= n)
            count = 1
            do while (i + count <= n)
                if (str(i + count:i + count) /= str(i:i)) exit
                count = count + 1
            end do
            res = trim(res) // trim(itoa(count)) // str(i:i)
            i = i + count
        end do
    end function rle_encode

    function rle_decode(str) result(res)
        character(len=*), intent(in) :: str
        character(len=20) :: res
        integer :: i, count, n, j

        res = ""
        n = len(str)
        i = 1
        do while (i <= n)
            count = 0
            do while (str(i:i) >= '0' .and. str(i:i) <= '9')
                count = count * 10 + (ichar(str(i:i)) - ichar('0'))
                i = i + 1
            end do
            do j = 1, count
                res = trim(res) // str(i:i)
            end do
            i = i + 1
        end do
    end function rle_decode

    function itoa(n) result(res)
        integer, intent(in) :: n
        character(len=10) :: res
        write(res, '(I0)') n
    end function itoa

end program run_length_encoding
