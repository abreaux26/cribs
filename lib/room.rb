class Room
  attr_reader :category

  def initialize(category, length=10, width)
    @category = category
    @length = length
    @width = width
  end

  def area
    @length * @width.to_i
  end
end
