
function foo(n)
	s = Array(Float64,n)
	z = Array(Float64,n)
	s[1] = 0.0
	z[2] = 1.0
	for k = 2:n
		z[k] = z[k-1] + (randbool() ? 1.0 : -1.0)
		s[k] = z[k]/√(abs(2*k*log(log(k))))
	end
	s
end

using PyPlot

n=1_000_000_000 
@time sl = foo(n)
inde = linspace(1, n, 50_000) |> int
plot(sl[inde])
plot(1:50_000, ones(50_000),":")
plot(1:50_000,-ones(50_000),":")
     