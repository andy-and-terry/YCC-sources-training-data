! Lattice paths with a DP row.
program lattice_paths
  implicit none
  integer, parameter :: n = 3
  integer :: row(0:n), j, k
  row = 1
  do k = 1, n
    do j = 1, n
      row(j) = row(j) + row(j - 1)
    end do
  end do
  print *, row(n)
end program lattice_paths
