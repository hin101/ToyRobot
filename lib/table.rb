class Table
  attr_accessor :position

  def place(x_pos, y_pos)
    self.position = { x: x_pos, y: y_pos } if valid_coordinates?(x_pos, y_pos)
  end

  def robot_placed?
    position != nil
  end

  private

  def valid_coordinates?(x, y)
    ((0..4).cover?(x) && (0..4).cover?(y))
  end
end
