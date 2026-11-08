program crc8_checksum
  implicit none
  character(len=9) :: s = "123456789"
  integer :: crc, i, k
  crc = 0
  do i = 1, len(s)
     crc = ieor(crc, iachar(s(i:i)))
     do k = 1, 8
        if (iand(crc, 128) /= 0) then
           crc = iand(ieor(ishft(crc, 1), 7), 255)
        else
           crc = iand(ishft(crc, 1), 255)
        end if
     end do
  end do
  print '(z2.2)', crc
end program crc8_checksum
