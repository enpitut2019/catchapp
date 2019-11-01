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

        render :json => @papers.to_json(:include => [:authors, :keywords])
    end

    private

    def paper_params
        params.permit(:abstract,:title,:publishedAt,:url)
    end
end
