module FooMeshInterface

using fooetal
using Meshing

export compute_sphere_volume, compute_sphere_surface_area, compute_ball_volume

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

end
