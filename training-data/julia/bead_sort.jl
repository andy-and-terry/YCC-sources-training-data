# Bead (gravity) sort.
function bead_sort(nums)
    cols = [count(>(i), nums) for i in 0:maximum(nums)-1]
    reverse([count(>(r), cols) for r in 0:length(nums)-1])
end
println(bead_sort([5, 3, 1, 4, 2]))
