class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(args)
    @chainring 	= args.fetch(:chainring, 40)
    @cog 	= args.fetch(:cog, 18)
    @wheel 	= args[:wheel]
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    ratio * diameter
  end

  # Isolating the reference
  def diameter
    wheel.diameter
  end

end

class Wheel
  attr_reader :rim, :tire

  def initialize(rim, tire)
    @rim = rim
    @tire = tire
  end

  def diameter
    rim + (tire * 2)
  end

  def circumference
    diameter * Math::PI
  end
end

@wheel = Wheel.new(26, 1.5)
puts @wheel.circumference

puts Gear.new(
  :chainring => 52, 
  :cog => 11, 
  :wheel => @wheel).gear_inches

puts Gear.new(
  :chainring => 30, 
  :cog => 27, 
  :wheel => Wheel.new(24, 1.25)).gear_inches
