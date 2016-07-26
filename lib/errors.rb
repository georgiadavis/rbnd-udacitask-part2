module UdaciListErrors
  class InvalidItemType < StandardError
    # if invalid_type
    #   raise ModuleName::ErrorName, "Scanner Communication Error..."
    # end
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
