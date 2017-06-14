class Robot
  attr_accessor :direction

  DIRECTIONS = %i[north east south west].freeze

  def orientation(orientation)
    self.direction = orientation if DIRECTIONS.include?(orientation)
  end

  def left
    self.direction = DIRECTIONS[(DIRECTIONS.index(direction) - 1) % 4]
  end

  def right
    self.direction = DIRECTIONS[(DIRECTIONS.index(direction) + 1) % 4]
  end

  def facing_direction?
    direction != nil
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
