class PapersController < ApplicationController
    def index
        @papers = Paper.all
        render :json => papers
    end


    def create
        @paper = Paper.new(paper_params)
        @authors = params[:authors].split(",")
        @authors_num = @authors.length

        if @paper.save
            for i in 0 .. @authors_num-1 do
                @author = @paper.authors.new(name:@authors[i])
                if @author.save
                else
                    render json: @paper.errors, status: :unprocessable_entity
                    return
                end
            end
            render :json => @paper.to_json(:include => [:authors, :keywords]),:status: :created, location: @user
        else
            render json: @paper.errors, status: :unprocessable_entity
        end
    end

    def all
        @papers = Paper.all

        render :json => {:papers => @papers.to_json(:include => [:authors, :keywords])}
    end

    private

    def paper_params
        params.permit(:abstract,:title,:publishedAt,:url)
    end

end
