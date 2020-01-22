require 'net/http'
require 'uri'

class FiguresController < ApplicationController
    def translate
        figure = Figure.find(translate_params[:id])
        text = URI.encode_www_form_component(figure.caption)
        unless text.nil? then
            uri_str = "https://script.google.com/macros/s/AKfycbxCeACoPPfC8stClMomoRepp36ytKFT7lkQ8CkFy5bMwd0jiDQ/exec?text=#{text}"
            response = fetch(uri_str)

            figure.update!(caption_ja: JSON.parse(response.body)["text"])
        end
        render :json => figure
    end

    private
    def translate_params
        params.permit(:id) 
    end

    def fetch(uri_str, limit = 10)
        # You should choose better exception.
        raise ArgumentError, 'HTTP redirect too deep' if limit == 0
      
        uri = URI.parse(uri_str)
        request = Net::HTTP::Get.new(uri.request_uri)

        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        
        response = http.request(request)

        case response
        when Net::HTTPSuccess
          response
        when Net::HTTPRedirection
          fetch(response['location'], limit - 1)
        else
          response.value
        end
    end
end
