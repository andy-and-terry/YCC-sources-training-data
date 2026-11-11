// Perrin sequence P(n)=P(n-2)+P(n-3)
def v = [3, 0, 2]
(3..9).each { i -> v << v[i - 2] + v[i - 3] }
println v.join(' ')
