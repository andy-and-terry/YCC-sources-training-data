using Test
add(a, b) = a + b
@testset "arithmetic" begin
    @test add(1, 2) == 3
    @test add(0.1, 0.2) ≈ 0.3
    @test_throws MethodError add("a", 1)
    @test_throws DomainError sqrt(-1)
    @testset "nested" begin
        @test [1, 2] == [1, 2]
        @test_broken false
    end
end
@testset "strings" begin
    @test uppercase("a") == "A"
    @test occursin("ell", "hello")
    @test_logs (:warn, "careful") @warn "careful"
end
println(@elapsed(sum(1:1000)) >= 0)
@assert 1 + 1 == 2 "math is broken"
println(try @assert false "custom assertion" catch e; e.msg end)
