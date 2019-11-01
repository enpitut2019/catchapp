class PapersController < ApplicationController
    def index
        @papers = Paper.all
        render :json => papers
    end


    def create
        @paper = Paper.new(paper_params)
        @authors = params[:authors].split(",")
        @authors_length = @authors.length

        if @paper.save
            for i in 0..@authors_length-1
                @author = @paper.authors.new(name:@authors[i])
                if @author.save
                else
                    render json: @author.errors, status: :unprocessable_entity
                    return
                end
            end

            render :json => @paper.to_json(:include => [:authors, :keywords])
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
        params.permit(:abstract,:abstract_ja,:title,:published_at,:url,:pdf_url)
    end

end
