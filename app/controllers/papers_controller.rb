class PapersController < ApplicationController
    def index
        @papers = Paper.all
        render :json => papers
    end
    def all
        @papers = Paper.all

        render :json => {:papers => @papers.to_json(:include => [:authors, :keywords])}
    end
end
