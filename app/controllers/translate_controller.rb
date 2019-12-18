require 'net/https'
require 'uri'

class TranslateController < ApplicationController
    def get
        text = URI.encode_www_form_component(params['text'])
        uri_str = "https://script.google.com/macros/s/AKfycbxCeACoPPfC8stClMomoRepp36ytKFT7lkQ8CkFy5bMwd0jiDQ/exec?text=#{text}"
        response = fetch(uri_str)

        id = params['paper']
        paper = Paper.find(id)
        type = params['type']

        case type
        when "title"
            paper.update!(title_ja: JSON.parse(response.body)["text"])
        when "abstract"
            paper.update!(abstract_ja: JSON.parse(response.body)["text"])
        else
        end

        render(json: JSON.parse(response.body))
        return
    end

    private
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
