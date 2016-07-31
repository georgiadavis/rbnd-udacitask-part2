class UdaciList
  include UdaciListErrors
  attr_reader :title, :items

  def initialize(options={})
    @title = options[:title]
    @items = []
  end

  def add(type, description, options={})
    type = type.downcase
    raise UdaciListErrors::InvalidItemType unless ["todo", "event", "link"].include? type
    # raise UdaciListErrors::InvalidPriorityValue unless ["high", "medium", "low"].include? options
    @items.push TodoItem.new(description, options) if type == "todo"
    @items.push EventItem.new(description, options) if type == "event"
    @items.push LinkItem.new(description, options) if type == "link"
  end
  def delete(index)
    raise UdaciListErrors::IndexExceedsListSize unless index < @items.length
    @items.delete_at(index - 1)
  end
  def all
    puts "-" * @title.length
    puts @title
    puts "-" * @title.length
    @items.each_with_index do |item, position|
      rows = []
      rows << ["#{position + 1})","#{item.details}"]
      table = Terminal::Table.new :rows => rows
      puts table
    end
  end
end
