class UdaciList
  include UdaciListErrors
  attr_reader :title, :items

  def initialize(options={})
    @title = options[:title]
    @items = []
  end
  def add(type, description, options={})
    type = type.downcase
    @items.push TodoItem.new(description, options) if type == "todo"
    @items.push EventItem.new(description, options) if type == "event"
    @items.push LinkItem.new(description, options) if type == "link"
  end
  def delete(index)
    @items.delete_at(index - 1)
  end
  def all
    puts "-" * @title.length
    puts @title
    puts "-" * @title.length
    @items.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details}"
    end
  end

  private

  def add_to_list
    # return error message "This Item Type does not exists. (InvalidItemType)"
    if @items.map { |item| item.description }.exclude? type =="todo" || type =="event" || type =="link"
      raise UdaciListErrors::InvalidItemType, "This type does not exist"
    else
      initialize << self
    end
  end
end
