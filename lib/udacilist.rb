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
    @items.push TodoItem.new(type, description, options) if type == "todo"
    @items.push EventItem.new(type, description, options) if type == "event"
    @items.push LinkItem.new(type, description, options) if type == "link"
  end
  def delete(list_index)
    raise UdaciListErrors::IndexExceedsListSize unless list_index < @items.length
    @items.delete_at(list_index - 1)
  end
  def all
    puts "-" * @title.length
    puts @title
    puts "-" * @title.length
    @items.each_with_index do |item, position|
      rows = []
      rows << ["#{position + 1})", "#{item.type}", "#{item.details}"]
      table = Terminal::Table.new :rows => rows
      puts table
    end
  end
  def filter(type)
     @items.select {|item| item.type == type}
  end
  def color_change(color)
      puts "-".colorize(:"#{color}") * @title.length
      puts @title
      puts "-".colorize(:"#{color}") * @title.length
      @items.each_with_index do |item, position|
        rows = []
        rows << ["#{position + 1})".colorize(:"#{color}"), "#{item.type}".colorize(:"#{color}"), "#{item.details}".colorize(:"#{color}")]
        table = Terminal::Table.new :rows => rows
        puts table
      end
  end
end
