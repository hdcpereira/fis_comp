using Plots

function angular_frequency(k, m)
    return sqrt(k/m)
end 

function harmonic_oscilator_pos(t, ω, A, ϕ)
    return @. A .* ( cos.(ω .* t .+ ϕ))
end   

function harmonic_oscilator_vel(t, ω, A, ϕ)
    return @. - ω * A * sin(ω * t + ϕ)
end

function amplitude(x_inicial, v_inicial, ω)
    return sqrt(x_inicial^2 + (v_inicial^2 / ω^2))
end

function angular_phase(x_inicial, v_inicial, ω)
    return atan( - v_inicial / (ω * x_inicial))
end

k = 2 # N/m
A = 5 # m
ϕ = pi/4 
m = 1.75 # 1.75 Kg
t = 0:0.1:10 #s

ω = angular_frequency(k,m);
x = harmonic_oscilator_pos(t, ω, A, ϕ);
v = harmonic_oscilator_vel(t, ω, A, ϕ);

# plot_font = "Times New Roman"
# default(linewidth=1, label=nothing, grid=true)

gr(xtickfontsize=8, ytickfontsize=8, xguidefontsize=9, yguidefontsize=9, legendfontsize=8, dpi=100);

p1 = plot(t, x, label = "posição")
p1 = xlabel!("time (s)")
p1 = ylabel!("posição (m)")

p2 = plot(t, v, label = "velocidade", color = "red")
p2 = xlabel!("time (s)")
p2 = ylabel!("velocidade (m/s)")

P1 = plot(p1,p2, size = (700, 250),
                left_margin = 4Plots.mm,
                bottom_margin = 4Plots.mm)

# savefig("plot_1.png")

x_inicial = 0.25 #m
v_inicial = 1.25 #m/s

ω = angular_frequency(k,m)
A = amplitude(x_inicial, v_inicial, ω)
ϕ = angular_phase(x_inicial, v_inicial, ω)

x = harmonic_oscilator_pos(t, ω, A, ϕ);
v = harmonic_oscilator_vel(t, ω, A, ϕ);

p1 = plot(t, x, label = "posição")
p1 = xlabel!("time (s)")
p1 = ylabel!("posição (m)")

p2 = plot(t, v, label = "velocidade", color = "red")
p2 = xlabel!("time (s)")
p2 = ylabel!("velocidade (m/s)")

P2 = plot(p1,p2, size = (700, 250),
                left_margin = 4Plots.mm,
                bottom_margin = 4Plots.mm)
# savefig("plot_2.png")

function kinetic_energy(m,v)
    return @. (1/2)* m * v^2 
end
    
function potential_energy(k, x)
    return @. (1/2) * k * x^2
end

K = kinetic_energy(m, v)
U = potential_energy(k, x)
E = K + U;

p1 = plot(t, K, label = "")
p1 = ylabel!("K (J)")

p2 = plot(t, U, color = "orange", label = "")
p2 = ylabel!("U (J)")

p3 = plot(t, E, color = "black", label = "")
p3 = ylabel!("E (J)")

P3 = plot(p1, p2, p3,size = (900, 250), layout= (1, 3),
xaxis = ("Tempo (s)"),
left_margin = 5Plots.mm,
bottom_margin = 4Plots.mm)


plot(P1, P2, P3)
# savefig("plot_3.png")