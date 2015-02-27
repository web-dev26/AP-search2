require "benchmark"
require "./Find"
require "./User"


describe User do
    it 'check round salary' do
        @user = User.new(age=80, salary=1000.845049, height=150, weight=10)
        @user.salary.should == 1000.85
    end
    
    it 'check count of users in arr' do
        @users = []
        10.times { @users.push(User.new)}
        @users.count.should == 10
    end

    it 'check new account range' do
        @user = User.new
        (0..100).should cover(@user.age)
        (0..1000000.0).should cover(@user.salary)
        (0..200).should cover(@user.height)
        (0..200).should cover(@user.weight)
    end
end

describe Find do
	before (:all) do
			@user1 = User.new(20,  1000,  120, 92)
			@user2 = User.new(30,  2000,  130, 93)
			@user3 = User.new(40,  3000,  140, 94)
			@user4 = User.new(50,  4000,  150, 95)
			@user5 = User.new(60,  5000,  160, 96)
			@user6 = User.new(70,  6000,  170, 97)
			@user7 = User.new(80,  7000,  180, 98)
			@user8 = User.new(90,  8000,  190, 99)
			@users = [@user1, @user2, @user3, @user4, @user5, @user6, @user7, @user8]
		end
	
	it 'check search with all given criteries, and one of this not range' do
		find = Find.new
		find.tree_data(@users)
		input = Hash[age: (85..95), salary: (7000..1000000.0), height: 190, weight: (88..100) ]
		find.search(input).should be == [@user8]
	end
	
	it 'check search with few given criteries,' do
		find = Find.new
		find.tree_data(@users)
		input = Hash[age: (10..30), weight: (93..94)]
		find.search(input).should be == [ @user2]
	end
	
	describe 'chek_input' do
	it 'make convert from i to range' do
		find = Find.new
		input = Hash[age: 99, height: 190]
		result = find.chek_input(input)
		result[:age].should be == (99..99)
		result[:height].should be == (190..190)
		end
	end
end