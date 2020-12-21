class Vector3D  
  def initialize(x = 0, y = 0, z = 0)
    @x = x
    @y = y
    @z = z
  end

  attr_reader :x, :y, :z

  def +(vector)
    Vector3D.new(x + vector.x,
                 y + vector.y,
                 z + vector.z)
  end

  def *(value)
    Vector3D.new(x * value,
                 y * value,
                 z * value)
  end

  def /(value)
    self * (1.to_f / value)
  end

  def inverse
    Vector.new(-x, -y, -z)
  end

  def length_squared
    Math.sqrt(length_squared)
  end

  def to_s
    "#{x} #{y} #{z}"
  end

  def dot(vector)
    (x * vector.x) + (y * vector.y) + (z * vector.z)
  end

  def cross(vector)
    Vector.new(y * vector.z - z * vector.y,
               z * vector.x - x * vector.z,
               x * vector.y - y * vector.x)
  end

  def unit_vector
    self / self.length
  end

  private

  def length_squared
    x ** 2 + y ** 2 + z ** 2
  end
end