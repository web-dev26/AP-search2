	class User
		attr_accessor :age, :salary, :height, :weight

		def initialize age=rand(0..100), salary=rand(0..1000000.0), height=rand(0..200), weight=rand(0..200)
			@age = age
			@salary = salary.round(2)
			@height = height
			@weight = weight
		end

	end