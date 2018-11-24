class ApplicationController < ActionController::API

    def encode(payload)
      JWT.encode(payload, ENV['JWT'])
    end

    def decode(payload)
      JWT.decode(payload, ENV['JWT'])
    end

end
