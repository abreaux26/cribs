class House
  attr_reader :price,
              :address,
              :rooms

  def initialize(price, address)
    @price = price.gsub('$','').to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    @price > 500000
  end

  def rooms_from_category(category)
    @rooms.find_all do |room|
      room.category == category
    end
  end

  def area
    @rooms.reduce(0) do |area, room|
      area += room.area
    end
  end

  def details
    {"price" => @price, "address" => @address}
  end

  def price_per_square_foot
    (@price / area.to_f).round(2)
  end

  def rooms_sorted_by_area
    @rooms.sort do |room|
      room.area
    end
  end

  def rooms_by_category
    rooms_hash = {}

    categories = rooms_sorted_by_area.map {|room| room.category}.uniq

    categories.each do |category|
      rooms_hash[category] = rooms_from_category(category)
    end

    rooms_hash
  end

end
