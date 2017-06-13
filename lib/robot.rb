class Robot
  attr_accessor :direction

  def orientation(orientation)
    self.direction = if %i[north south west east].include?(orientation)
                       orientation
                     end
  end

  def course
    case direction
    when :north
      { x: 0, y: 1 }
    when :south
      { x: 0, y: -1 }
    when :west
      { x: -1, y: 0 }
    when :east
      { x: 1, y: 0 }
    end
  end
end
