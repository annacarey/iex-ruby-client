module IEX
    module Endpoints
      module Batch
        def batch(symbol, options = {})
          IEX::Resources::Batch.new(get("stock/#{symbol}/batch", { token: publishable_token }.merge(options)))
        rescue Faraday::ResourceNotFound => e
          raise IEX::Errors::SymbolNotFoundError.new(symbol, e.response[:body])
        end
  
        def market_batch(options = {})
          Hash[get('stock/market/batch', { token: publishable_token }.merge(options)).map do |k, v|
            [k, IEX::Resources::Batch.new(v)]
          end]
        end
      end
    end
  end
  