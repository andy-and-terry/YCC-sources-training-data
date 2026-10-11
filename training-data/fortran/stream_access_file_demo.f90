program stream_access_file_demo
    implicit none
    integer :: u, i, v
    integer :: data(5) = [10, 20, 30, 40, 50]

    open (newunit=u, file='stream_tmp.bin', access='stream', form='unformatted', &
          status='replace')
    write (u) data
    close (u)

    open (newunit=u, file='stream_tmp.bin', access='stream', form='unformatted', &
          status='old')
    read (u, pos=1 + 2 * 4) v
    print *, 'third element =', v
    close (u, status='delete')
    i = size(data)
    print *, 'written', i, 'integers'
end program stream_access_file_demo
