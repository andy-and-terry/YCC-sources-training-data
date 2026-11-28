program bit_reversal
  implicit none
  integer, parameter :: values(4) = [1, 6, 13, 128]
  integer :: i

  do i = 1, size(values)
     print '(I0,1X,I0)', values(i), reverse_byte(values(i))  ! 128 96 176 1
  end do

contains

  integer function reverse_byte(v)
    integer, intent(in) :: v
    integer :: k
    reverse_byte = 0
    do k = 0, 7
       if (btest(v, k)) reverse_byte = ibset(reverse_byte, 7 - k)
    end do
  end function reverse_byte
end program bit_reversal
