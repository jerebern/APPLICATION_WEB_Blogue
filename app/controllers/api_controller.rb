class ApiController < ActionController::API

    def redirect_to(option = {}, response_status = {})

        render :json => {options: options}
    end
end
