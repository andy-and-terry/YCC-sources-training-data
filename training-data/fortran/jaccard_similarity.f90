program jaccard_similarity
  implicit none
  logical :: a(0:9) = .false., b(0:9) = .false.
  a([1, 2, 3, 4]) = .true.
  b([3, 4, 5]) = .true.
  print '(F4.2)', real(count(a .and. b)) / real(count(a .or. b))
end program jaccard_similarity
