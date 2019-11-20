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
            render :json => @paper.to_json(:include => [:authors, :keywords]), status: :created, location: @user
        else
            render json: @paper.errors, status: :unprocessable_entity
        end
    end

    def upload
        raise ArgumentError, 'invalid params' if params[:figure].blank? 

        paper=Paper.find_by(id: params[:paper_id])
    
        figure = paper.figures.create(figure: params[:figure])
    
        figure.explanation = params[:explanation]
    
        figure.save!
    
        render json: {
            explanation: figure.explanation,
            figure: figure.figure.url
        }
      end

    def all
        @papers = Paper.all
        render :json => @papers.to_json(:include => [:authors, :keywords, :figures])

    end

    private

    def paper_params
        params.permit(:abstract,:abstract_ja,:title,:title_ja,:published_at,
        :cite_count,:cited_count,:journal,:pdf_url,:url)
    end

end
