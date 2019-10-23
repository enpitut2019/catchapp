class PapersController < ApplicationController
    
    def index
        @papers = Paper.all
        render :json => papers
    end
    def all
        @papers = Paper.all
        @keywords = Keyword.all
        @authors = Author.all

        render :json => {:papers => @papers,:keywords => @keywords, :authors=> @authors}
    end
end
