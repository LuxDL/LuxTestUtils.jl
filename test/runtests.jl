using LuxTestUtils, Test

# Ensure that code loads correctly
@testset "LuxTestUtils" begin
    @testset "Simple JET Tests" begin
        @jet sum([1, 2, 3]) target_modules=(Base, Core)
        @jet sum(1, 1) target_modules=(Base, Core) opt_broken=true call_broken=true
    end

    @testset "Simple Gradient Tests" begin
        x = randn(10)
        @test_gradients sum abs2 x
        @test_gradients prod x
    end
end
