module UdaciListErrors
  class InvalidItemType < StandardError
    if @items.select { |item| item.type }.include? type
      UdaciList.add
    else
      raise UdaciListErrors::InvalidItemType, "This type does not exist"
    end
  end

  class IndexExceedsListSize < StandardError
    # if exceed_list_size
    #   raise ModuleName::ErrorName, "Scanner Communication Error..."
    # end
  end

  class InvalidPriorityValue < StandardError
    # if invalid_priority
    #   raise ModuleName::ErrorName, "Scanner Communication Error..."
    # end
  end

end
