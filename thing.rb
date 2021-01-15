require 'active_support/core_ext/string'

class Thing
 # magic
end

cow = Thing.new('Cow')
cow.name

# can define boolean methods on an instance
cow.is_a.person
cow.is_a.woman
cow.is_not_a.man

cow.person? # => true
cow.man? # => false

# can define properties on a per instance level
cow.is_the.parent_of.boo
cow.parent_of # => 'boo'

# can define number of child things
# when more than 1, an array is created
cow.has(2).legs
cow.legs.size # => 2
cow.legs.first.is_a?(Thing) # => true

# can define single items
cow.has(1).head

cow.head.is_a?(Thing) # => true

# can define number of things in a chainable and natural format
cow.has(2).arms.each { having(1).hand.having(5).fingers }

cow.arms.first.hand.fingers.size # => 5

# can define properties on nested items
cow.has(1).head.having(2).eyes.each { being_the.color.blue.and_the.shape.round }

# can define methods
cow.can.speak('spoke') do |phrase|
  "#{name} says: #{phrase}"
end

cow.speak("hello") # => "cow says: hello"

# if past tense was provided then method calls are tracked
cow.spoke # => ["cow says: hello"]
