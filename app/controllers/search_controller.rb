class SearchController < ApplicationController
    def get_xml
        require 'net/http'
        require 'uri'
        search_word = URI.encode_www_form_component(params['search_word'])
        
        #byebug

        url = URI.parse("http://export.arxiv.org/api/query?search_query=abs:#{search_word}&start=0&max_results=30")
        res = Net::HTTP.get_response(url)
        print res.body
    end
end
