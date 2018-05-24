require 'display'

RSpec.describe Display do
  let(:output)    { double('output') }
  let(:statement) { double('statement') }

  subject(:display) { described_class.new(output) }

  describe '#print' do
    it 'instructs output to call puts with the statement' do
      allow(output).to receive(:puts).with(statement).and_return('Hello')
      expect(display.print(statement)).to eq 'Hello'
    end
  end
end
