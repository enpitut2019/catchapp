class PapersController < ApplicationController
    
    def index
        @papers = Paper.all
        render :json => papers
    end


    def create
        @paper = Paper.new(paper_params)
        if @paper.save
            render json: @paper, status: :created, location: @user
        else
            render json: @paper.errors, status: :unprocessable_entity
        end
    end

    def all
        @papers = Paper.all
        @keywords = Keyword.all
        @authors = Author.all

        render :json => {:papers => @papers,:keywords => @keywords, :authors=> @authors}
    end

    private

    def paper_params
        params.permit(:abstract,:title,:publishedAt,:url)
    end
end
