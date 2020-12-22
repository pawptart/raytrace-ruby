class HitRecord
  # Struct for holding hit statistics
  #
  # In the C++ code, this was referred to as:
  #
  # struct hit_record {
  #   point3 p;
  #   vec3 normal;
  #   double t;
  # };
  #
  # Calling #hit? on a hittable sets its associated HitRecord values
  def initialize(point = nil, normal = nil, t = nil)
    @point      = point
    @normal     = normal
    @t          = t
    @front_face = false
  end

  attr_accessor \
    :front_face,
    :point,
    :normal,
    :t

  def set_face_normal(ray, outward_normal)
    @front_face = ray.direction.dot(outward_normal) < 0
    @normal = front_face ? outward_normal : outward_normal.inverse
  end
end

class Hittable
  def initialize(ray, t_min, t_max, hit_record = HitRecord.new)
    @ray        = ray
    @t_min      = t_min
    @t_max      = t_max
    @hit_record = hit_record
  end

  attr_reader \
    :ray,
    :t_min,
    :t_max,
    :hit_record
end

class HittableList
  def initialize
    @objects = []
  end

  attr_accessor :objects

  def add(object)
    objects << object
  end

  def clear
    objects = []
  end

  def hit?(ray, t_min, t_max, hit_record)
    temp_record  = HitRecord.new
    hit_anything = false
    closest      = t_max

    objects.each do |object|
      next unless object.hit?(ray, t_min, t_max, hit_record)

      hit_anything = true
      closest      = temp_record.t
      hit_record   = temp_record
    end

    hit_anything
  end
end
