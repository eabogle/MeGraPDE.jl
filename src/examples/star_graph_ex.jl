# ==============================
# Star graph example for MeGraPDE
# Fully-featured: plots, eigenvalues, eigenfunctions
# ==============================

#using Pkg
#Pkg.activate(joinpath(@__DIR__, "..", ".."))  # activate repo root

using MeGraPDE
using Graphs
using GLMakie   # interactive 3D plotting

# ==============================
# Create a combinatorial star graph
# ==============================
G = star_graph(5)        # 5 vertices, 4 edges

# Define edge length
l = pi + pi/2

# Assign vertex coordinates
coords = [[0,0],
          [l,0],
          [-l,0],
          [0,l],
          [0,-l]]

# Extend to a metric graph with coordinates
Gamma = metric_graph(G, l, vertex_coords = coords)

# ==============================
# Plot the metric graph
# ==============================
fig_graph = plot_graph_3d(Gamma)
display(fig_graph)  # opens a GLMakie window

# ==============================
# Define a function on the edges
# ==============================
u = [ x -> -3*sin(x),
      x -> sin(x),
      x -> sin(x),
      x -> sin(x)
    ]

# Plot the function on the graph
fig_func = plot_function_3d(Gamma, u)
display(fig_func)