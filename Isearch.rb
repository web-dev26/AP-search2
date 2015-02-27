require_relative "./Find"
require_relative "./User"
require "benchmark"

@input = Hash[age: (40..100), salary: (896543..1000000.0), height: (145..190), weight: (75..200)]

@find = Find.new
@users = []

puts Benchmark.measure {  10000000.times { @users.push(User.new)} }
puts Benchmark.measure {  @find.tree_data(@users) }
puts Benchmark.measure {  @find.search(@input) }

