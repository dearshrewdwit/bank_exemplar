module Formats
  module Date
    DATE_FORMAT = '%m/%d/%Y'

    private

    def formatted(date)
      date.strftime(DATE_FORMAT)
    end
  end
end
