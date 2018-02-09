def calc(first, second)
  first * second
end


module Mymodule
  def print_jellp
    puts "hekko"
  end
end

class Human

  attr_accessor :name, :age, :specie_name
  # class variable is immutable
  @@specie_name = "skkkiii"

  def initialize(age, name)
    @age = age
    @name = name
  end

# getter
  def name()
    @name
  end

  #setter
  def name=(new_name)
    @name = new_name
  end

  # or use attribute getter/writter/both: attr_accessor
  include Mymodule
  # if we use extend, it doesn't apply to instance
end

# make a new class
# Animal = Class.new

# Animal.define_method :cry do puts "yooo" end

# subclassing:

Animal = Human.new(age, name)
Animal.define_method :cry do puts "yooo" end

# or:
class Animal < Human

  def cry
  end

end
