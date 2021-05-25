module BaseHelper

  def getSummaryData(filters)
    # today = Date.current - 7.days # We don't have data after that UwU
    # # today = today.strftime("%Y/%m/%d")

    # @data = []
    # (0..6).to_a.each do |offset|
    #   now = (today - offset.days).strftime("%Y/%m/%d")
    #   @data << CovidCase.find_by(:Date => now, :Location => 'India')
    # end

    location = filters[:location]
    start_date = DateTime.parse(filters[:date_from])
    end_date = DateTime.parse(filters[:date_to])

    if(start_date > end_date)
      return []
    end

    @data = []
    left_limit = DateTime.parse("10/03/2020")
    right_limit = Date.current

    start_date = (start_date < left_limit) ? left_limit : start_date
    end_date = (end_date > right_limit) ? right_limit : end_date

    while start_date <= end_date do
      start_date = start_date + 1.days
      data_found = CovidCase.find_by(:Date => start_date.strftime("%Y/%m/%d"), :Location => location)

      if !data_found.nil?
        @data << data_found
      end
    end
    
    p @data
    @data 
  end
end
