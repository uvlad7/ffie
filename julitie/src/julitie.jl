module julitie

# Write your package code here.

using Crayons

Base.@ccallable function hello_julitie()::Nothing
	# println("Hello from ", 
	# 	Crayon(foreground = (77, 100, 173)), "J",
	# 	Crayon(reset = true), "u",
	# 	Crayon(foreground = (201, 60, 50)), "l",
	# 	Crayon(foreground = (57, 150, 70)), "i",
	# 	Crayon(foreground = (145, 89, 162)), "a",
	# 	Crayon(reset = true), "!")
		println("Hello from ",
		Crayon(foreground = ((145, 89, 162))), "Julia",
		Crayon(reset = true), "!")
		atexit(bye_julitie)
end

Base.@ccallable function bye_julitie()::Nothing
	println("Bye from ",
	Crayon(foreground = ((145, 89, 162))), "Julia",
	Crayon(reset = true), "!")
end

# export hello_julitie

end
