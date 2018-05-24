module Formats
  module Statement
    HEADER = %w(date credit debit balance).freeze
    DELIMITER = ' || '

    private

    def statement_header
      HEADER.join(DELIMITER)
    end
  end
end
