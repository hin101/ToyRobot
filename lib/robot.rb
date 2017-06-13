class Robot
  attr_accessor :direction

  def orientation(orientation)
    if %i[north south west east].include?(orientation)
      self.direction = orientation
    end
  end
end
