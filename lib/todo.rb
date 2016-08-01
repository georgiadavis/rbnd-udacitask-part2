class TodoItem
  include Listable
  attr_reader :description, :due, :priority

  def initialize(description, options={})
    @description = description
    @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    @priority = options[:priority]
    raise UdaciListErrors::InvalidPriorityValue unless ["high", "medium", "low", nil].include? @priority
  end

  def details
    format_description(@description) + "due: " +
    format_date +
    format_priority
  end
end
