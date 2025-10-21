# ==============================
# Star graph example for MeGraPDE
# Fully-featured: saves plots automatically in headless mode
# ==============================

using MeGraPDE
using Graphs
using Plots
using Measures

# ==============================
# Configure Plots/GR for headless mode
# ==============================
gr()                        # select GR backend
Plots.default(show=false)    # do not open any GUI windows

# ==============================
# Create figures folder if it doesn't exist
# ==============================
plots_dir = "figures"
if !isdir(plots_dir)
    mkdir(plots_dir)
end

# ==============================
# Create a combinatorial star graph
# ==============================
G = star_graph(5)        # 5 vertices, 4 edges
l = pi + pi/2            # edge length

vert_coords = [[0,0],
                 [l,0],
                 [-l,0],
                 [0,l],
                 [0,-l]]

Gamma = metric_graph(G, l, vertex_coords = vert_coords)

# ==============================
# Save metric graph plot
# ==============================
plot_graph_3d(Gamma;
    save_as = joinpath(plots_dir, "star_graph.png"),
    set_title = "Star Graph",
    color = "gray",
    size = (600,600)
)

# ==============================
# Define a function on the edges
# ==============================
u = [ x -> -3*sin(x),
      x -> sin(x),
      x -> sin(x),
      x -> sin(x)
    ]

# ==============================
# Save function-on-graph plot
# ==============================
plot_function_3d(Gamma, u;
    save_as = joinpath(plots_dir, "star_graph_function.png"),
    set_title = "Function on Star Graph",
    color_graph = "gray",
    color_func = "cornflowerblue",
    size = (600,600),
    lw = 5
)

println("Plots saved in folder: $plots_dir")
