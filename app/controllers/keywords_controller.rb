class KeywordsController < ApplicationController
    def index
        keywords = Keyword.all 
        render :json => keywords
    end
end
