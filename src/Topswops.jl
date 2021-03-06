#Topswops
#http://rosettacode.org/wiki/Topswops

function fannkuch(n)
	n == 1 && return 0
	n == 2 && return 1
	p = [1:n]
	q = copy(p)
	s = copy(p)
	sign = 1; maxflips = sum = 0
	while true
		q0 = p[1]
		if q0 != 1
			for i = 2:n
				q[i] = p[i]
			end
			flips = 1
			while true
				qq = q[q0]
				if qq == 1
					sum += sign*flips
					flips > maxflips && (maxflips = flips)
					break
				end
				q[q0] = q0
				if q0 >= 4
					i = 2; j = q0-1
					while true
						t = q[i]
						q[i] = q[j]
						q[j] = t
						i += 1
						j -= 1
						i >= j && break
					end
				end
				q0 = qq
				flips += 1
			end
		end
		#permute
		if sign == 1
			t = p[2]
			p[2] = p[1]
			p[1] = t
			sign = -1
		else
			t = p[2]
			p[2] = p[3]
			p[3] = t
			sign = 1
			for i = 3:n
				sx = s[i]
				if sx != 1
					s[i] = sx-1
					break
				end
				i == n && return maxflips
				s[i] = i
				t = p[1]
				for j = 1:i
					p[j] = p[j+1]
				end
				p[i+1] = t
			end
		end
	end
end

# Output
function main()
for i = 1:10
	println(fannkuch(i))
end
end
@time main()