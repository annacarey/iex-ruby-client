require 'spec_helper'

describe IEX::Resources::Batch do
  include_context 'client'

  context 'known symbol', vcr: { cassette_name: 'batch/msft' } do
    subject do
      client.batch('MSFT')
    end
  end

  context 'market', vcr: { cassette_name: 'batch/market' } do
    subject do
      client.market_batch
    end
    # it 'retrieves a right number of stocks' do
    #   expect(subject.size).to eq 8890
    # end
  end
end
