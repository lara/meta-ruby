#!/usr/bin/env ruby

class Thing
  attr_reader :name, :attributes

  def initialize(name)
    @name = name
    @attributes = {}
  end

  def is_a
    AttributeSetter.new(self)
  end

  def is_not_a
    AttributeSetter.new(self, invert: true)
  end

  def set_attribute(attribute, value)
    attributes[attribute] = value

  end

  def method_missing(m, *args, &block)

  end
end

class AttributeSetter
  def initialize(thing, invert: false)
    @thing = thing
    @invert = invert
  end

  def method_missing(m, *args, &block)
    @thing.set_attribute(m, @invert ? false : true)
  end
end

kaia = Thing.new('kaia')
kaia.name # => 'kaia'

# can define boolean methods on an instance
kaia.is_a.person
kaia.is_a.woman


kaia.is_not_a.man
puts kaia.attributes.inspect

kaia.person? # => true
kaia.man? # => false
=begin

# can define properties on a per instance level
kaia.is_the.parent_of.cow
kaia.parent_of # => 'cow'

# can define number of child things
# when more than 1, an array is created
kaia.has(2).legs
kaia.legs.size # => 2
kaia.legs.first.is_a?(Thing) # => true

# can define single items
kaia.has(1).head

kaia.head.is_a?(Thing) # => true

# can define number of things in a chainable and natural format
kaia.has(2).arms.each { having(1).hand.having(5).fingers }

kaia.arms.first.hand.fingers.size # => 5

# can define properties on nested items
kaia.has(1).head.having(2).eyes.each { being_the.color.blue.and_the.shape.round }

# can define methods
kaia.can.speak('spoke') do |phrase|
  "#{name} says: #{phrase}"
end

kaia.speak("hello") # => "kaia says: hello"

# if past tense was provided then method calls are tracked
kaia.spoke # => ["kaia says: hello"]
=end
