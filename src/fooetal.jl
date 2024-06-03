module fooetal

using Meshes
export calculate_sphere_volume, calculate_sphere_surface_area, calculate_spherical_cap_volume

"""
    calculate_sphere_volume(radius::Real)

Calculate the volume of a sphere using  the radius.

# Arguments
- `radius::Real`: The radius of the sphere.

# Returns
- `volume::Float64`: The calculated volume of the sphere.

# Examples
```jldoctest
julia> calculate_sphere_volume(1.0)
4.188790204786391

julia> calculate_sphere_volume((1/π)^(1/3)
1.3333333333333333
```
end
"""
function calculate_sphere_volume(radius::Real)
    if radius < 0
        throw(DomainError(radius, "Radius cannot be negative"))
    end
    volume = (4/3) * π * radius^3    
end

"""
    calculate_sphere_volume(radii::AbstractVector)

Calculate the volume of a spheres using  the radii.
"""
calculate_sphere_volume(radii::AbstractVector) = calculate_sphere_volume.(radii)

"""
    calculate_sphere_volume_diameter(diameter::Real)
"""
calculate_sphere_volume_diameter(diameter::Real) = calculate_sphere_volume(diameter/2)

"""
    calculate_sphere_surface_area(radius::Real)

Calculate the surface area of a sphere using  the radius.
Uses the formula: 4πr^2, but is calculated as a function of volume, 
to grab the DomainError thrown by calculate_sphere_volume.
"""
calculate_sphere_surface_area(radius::Real) = calculate_sphere_volume(radius)*3.0*radius



"""
    calculate_spherical_cap_volume(radius::Real, height::Real)

Calculate the volume of a spherical cap using  the radius and height.
"""
function calculate_spherical_cap_volume(radius::Real, height::Real)    
    if height < 0
        throw(DomainError(height, "Height cannot be negative"))
    end
    if radius < 0
        throw(DomainError(radius, "Radius cannot be negative"))
    end
    cap_volume = (1/3) * π * height^2 * (3 * radius - height)

end

""" Why julia is cool? 
- Multiple dispatch to handle parameterization!!!!!!!
Just change the type of the input and you can use the same function to calculate the volume of a sphere with a complex radius.
"""
calculate_sphere_volume(radius::Complex) = calculate_sphere_volume(abs(radius)|>Real) 


# CODE TO SHOW INTERFACING OF OTHER PACKAGES



"""
    compute_sphere_volume(sphere::Sphere)

Compute the volume of a given sphere using the Foo et al. parameterization.

# Arguments
- `sphere::Sphere`: The sphere for which the volume needs to be computed.

# Returns
- `volume::Float64`: The computed volume of the sphere.
"""
function compute_sphere_volume(sphere::Sphere)    
    calculate_sphere_volume(radius(sphere))
end

"""
    compute_sphere_surface_area(sphere::Sphere)

Compute the surface area of a given sphere using the Foo et al. parameterization.

# Arguments
- `sphere::Sphere`: The sphere for which the surface area needs to be computed.

# Returns
- `surface_area::Float64`: The computed surface area of the sphere.
"""
function compute_sphere_surface_area(sphere::Sphere)    
    calculate_sphere_surface_area(radius(sphere))
end

"""
    compute_ball_volume(ball::Ball)

Compute the volume of a given ball using the Foo et al. parameterization.

# Arguments
- `ball::Ball`: The ball for which the volume needs to be computed.

# Returns
- `volume::Float64`: The computed volume of the ball.
"""
function compute_ball_volume(ball::Ball)
    sphere = ball.solid
    compute_sphere_volume(sphere)
end

"""
    compare_sphere_volume(sphere::Sphere)

Compare the volume of a given sphere using the Foo et al. parameterization and the measure function from the Meshes.jl package.
# Arguments
- `sphere::Sphere`: The sphere for which the volume needs to be compared.
# Returns
- `error::Float64`: The absolute difference between the two volume calculations.
"""
function compare_sphere_volume(sphere::Sphere)
    fooetal_volume = compute_sphere_volume(sphere)
    meshes_volume = measure(sphere)
    error = abs(fooetal_volume - meshes_volume)
end

end