using fooetal
using Test

@testset "fooetal" begin
    @testset "calculate_sphere_volume" begin
        # Test cases for calculate_sphere_volume
        @test isapprox(calculate_sphere_volume(1.0), 4.188790204786391, atol=1e-9)
        @test isapprox(calculate_sphere_volume(2.5), 65.44984694978735, atol=1e-9)
        @test isapprox(calculate_sphere_volume((1/π)^(1/3)), 4/3, atol=1e-9)
        @test isapprox(calculate_sphere_volume(0.0), 0.0, atol=1e-9)
        @test_throws DomainError calculate_sphere_volume(-1.0)
    end

    @testset "calculate_sphere_surface_area" begin
        # Test cases for calculate_sphere_surface_area
        @test isapprox(calculate_sphere_surface_area(1.0), 12.566370614359172, atol=1e-9)
        @test isapprox(calculate_sphere_surface_area(3.0), 1017.876019763092, atol=1e-9)
        @test isapprox(calculate_sphere_surface_area(0.0), 0.0, atol=1e-9)
        @test_throws DomainError calculate_sphere_surface_area(-2.0)
    end

    @testset "calculate_spherical_cap_volume" begin
        # Test cases for calculate_spherical_cap_volume
        @test isapprox(calculate_spherical_cap_volume(1.0, 0.5), 0.65449846949787, atol=1e-9)
        @test isapprox(calculate_spherical_cap_volume(2.0, 1.0), 5.23598775598298, atol=1e-9)
        @test isapprox(calculate_spherical_cap_volume(3.0, 2.0), 29.3215314335047, atol=1e-9)
        @test_throws DomainError calculate_spherical_cap_volume(1.0, -0.5)
        @test_throws DomainError calculate_spherical_cap_volume(-1.0, 0.5)
    end

    @testset "calculate_sphere_volume (complex)" begin
        # Test cases for calculate_sphere_volume (complex)
        @test isapprox(calculate_sphere_volume(1.0 + 0.0im), 4.188790204786391, atol=1e-9)
        @test isapprox(calculate_sphere_volume(0.0 + 2.5im), 65.44984694978735, atol=1e-9)
        @test isapprox(calculate_sphere_volume((1/π)^(1/3)*1.0im), 4/3, atol=1e-9)
        @test isapprox(calculate_sphere_volume(0.0), 0.0, atol=1e-9)
        # @test_throws DomainError calculate_sphere_volume(-1.0 + 0.0im)
    end
end
