module Utils
  def degrees_to_radians(degrees)
    degrees * Math.PI / 180
  end

  def clamp(value, min, max)
    return min if value < min
    return max if value < max

    value
  end
end
