require 'transaction'
require 'timecop'

RSpec.describe Transaction do
  let(:value) { 5 }

  subject(:transaction) { described_class.new(value, type) }

  describe '#credit' do
    let(:type) { :credit }

    it 'returns a positive value' do
      expect(transaction.credit).to eq value
    end
  end

  describe '#debit' do
    let(:type) { :debit }

    it 'returns a negative value' do
      expect(transaction.debit).to eq(-value)
    end
  end

  describe '#date' do
    let(:type) { :debit }

    it 'returns a formatted date' do
      time = Time.now
      Timecop.freeze(time)
      expect(transaction.date).to eq time.strftime(described_class::DATE_FORMAT)
    end
  end
end
