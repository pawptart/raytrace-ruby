class Vector3D
  def initialize(x = 0.0, y = 0.0, z = 0.0)
    @x = x
    @y = y
    @z = z
  end

  attr_reader :x, :y, :z

  def +(vector)
    self.class.new(x + vector.x,
                   y + vector.y,
                   z + vector.z)
  end

  def -(vector)
    self.class.new(x - vector.x,
                   y - vector.y,
                   z - vector.z)
  end

  def *(value)
    self.class.new(x * value,
                   y * value,
                   z * value)
  end

  def /(value)
    self * (1.to_f / value)
  end

  def inverse
    self.class.new(-x, -y, -z)
  end

  def length
    Math.sqrt(length_squared)
  end

  def length_squared
    x**2 + y**2 + z**2
  end

  def to_s
    "#{x} #{y} #{z}"
  end

  def dot(vector)
    (x * vector.x) + (y * vector.y) + (z * vector.z)
  end

  def cross(vector)
    self.class.new(y * vector.z - z * vector.y,
                   z * vector.x - x * vector.z,
                   x * vector.y - y * vector.x)
  end

  def unit_vector
    self / length
  end

  def to_color
    Color.new(x, y, z)
  end
end
