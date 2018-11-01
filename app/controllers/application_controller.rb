class ApplicationController < ActionController::API

    def encode(payload)
      JWT.encode(payload, "secret")
    end

    def decode(payload)
      JWT.decode(payload, "secret")
    end

    def logged_in
    end

    def current_user
    end
end
