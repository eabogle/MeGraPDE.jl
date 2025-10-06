# © Anna Weller, University of Cologne, 2023

using MeGraPDE
using Plots, Measures
using Graphs, LinearAlgebra

function animate_diffusion(Γ::EquilateralMetricGraph, u0::Vector{Function}, T::Number; α = 1)
    dt = T /50
    σ = eigen_quantum(Γ, K=20)
    coefs = projection_coefficients_filon(Γ, σ, u0, 500)
    anim = @animate for t in 0:dt:T
        coef_t = exp(-t*Diagonal(σ.Λ.^(α)))*coefs
        u_Q=spectral_solution(Γ, σ, coef_t)
        plot_function_3d(Γ, u_Q, size=(150,150), lw=2, grid_off=true)
    end
    gif(anim, joinpath(@__DIR__, "diffusion.gif"), fps=5)
    println("Saved GIF to: ", joinpath(@__DIR__, "diffusion.gif"))
end
