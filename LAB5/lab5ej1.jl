function intenumcomp(fun,a,b,N,regla)
	if regla == "trapecio"
		h = (b-a)/N
		res = fun(a) + fun(b)
		for i=1:N-1
			res = res + 2*fun(a + i*h)
		end
		return h/2*res
	elseif regla == "pm"
		h = (b-a)/N
		xi = zeros(N+1)
		xi[1] = a
		for i=2:N+1
			xi[i] = a + (i-1)*h
		end
		res = 0
		for i=1:N
			res = res + fun((xi[i]+xi[i+1])/2)
		end
		return h*res
	elseif regla == "simpson"
		h = (b-a)/(2*N)
		xi = zeros((2*N)+1)
		xi[1] = a
		for i=2:(2*N)+1
			xi[i] = a + (i-1)*h
		end
		res = fun(a) + fun(b)
		for i=1:N-1
			res = res + 2*fun(xi[(2*i)+1])
		end
		for i=1:N
			res = res + 4*fun(xi[2*i])
		end
		return res * h/3
	end
end

function a(x)
	return MathConstants.e ^ (-x)
end


function a(x)
	return 3*x
end
