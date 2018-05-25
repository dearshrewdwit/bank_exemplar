Dir['./lib/**/*.rb'].each { |file| require file }

require 'timecop'

RSpec.describe 'Bank Tech Test' do
  let(:expected_output) do
    "date || credit || debit || balance\n05/24/2018 ||  || -500 || 2500\n05/24/2018 || 2000 ||  || 3000\n05/24/2018 || 1000 ||  || 1000\n"
  end

  describe 'App can deposit, withdraw, and print a statement' do
    it 'returns the expected output' do
      time = Time.new(2018, 5, 24)
      Timecop.freeze(time)

      account = Account.new
      account.deposit(1000)
      account.deposit(2000)
      account.withdraw(500)
      statement = Statement.create_from(account.transactions)
      output = StringIO.new
      display = Display.new(output)
      display.print(statement)

      expect(output.string).to eq(expected_output)
    end
  end
end
