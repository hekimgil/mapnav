module ApplicationHelper
  METERS_PER_LATITUDE_DEGREE = 111181.9
  PER_LATITUDE_DEGREE = METERS_PER_LATITUDE_DEGREE * 1.0
  EARTH_RADIUS_IN_METERS = 6376772.71
  PI_DIV_RAD = Math::PI / 180

  def distance(la1, lo1, la2, lo2)
    if (la1 == la2) and (lo1 == lo2)
      return 0.0
    else
      lat = (la1 + la2) / 2
      lon_multiplier = EARTH_RADIUS_IN_METERS * Math.cos(lat * PI_DIV_RAD) * PI_DIV_RAD
      lat_length = PER_LATITUDE_DEGREE * (la1 - la2)
      lon_length = lon_multiplier * (lo1 - lo2)
      return Math.sqrt(lat_length**2 + lon_length**2)
    end
  end

  def proximity(la1, lo1, m)
    lon_multiplier = EARTH_RADIUS_IN_METERS * Math.cos(la1 * PI_DIV_RAD) * PI_DIV_RAD
    lat_range = m / PER_LATITUDE_DEGREE
    lon_range = m / lon_multiplier
    return lat_range, lon_range
  end
end
