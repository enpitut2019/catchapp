require 'net/http'
require 'uri'

class PapersController < ApplicationController
    def index
        @papers = Paper.all
        render :json => papers
    end

    def show
        def show_params
            params.permit(:id)
        end
        @paper = Paper.find(show_params[:id])
        
        render :json => @paper.to_json(:include => [:authors, :keywords, :figures])
    end


    def create
        @paper = Paper.new(paper_params)
        @authors_num = 0
        @keywords_num = 0

        if(!params[:authors].nil?)
            @authors = params[:authors].split(",")
            @authors_num = @authors.length
        end
        if(!params[:keywords].nil?)
            @keywords = params[:keywords].split(",")
            @keywords_num = @keywords.length
        end

        if @paper.save
            for i in 0 .. @authors_num-1 do
                @author = Author.find_by(name: @authors[i])
                if(@author.nil?)
                    @paper.authors.new(name:@authors[i])
                else
                    @paper.paper_authors.find_or_create_by(author_id:@author.id)
                end
                if @paper.save 
                else
                    render json: @paper.errors, status: :unprocessable_entity
                    return
                end
            end
            for i in 0 .. @keywords_num-1 do
                @keyword = Keyword.find_by(name: @keywords[i])
                if @keyword.nil?
                    @paper.keywords.new(name:@keywords[i])
                else
                    @paper.paper_keywords.find_or_create_by(keyword_id:@keyword.id)
                end
                if @paper.save 
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

    def get_figure
        @paper = Paper.find(params[:paper_id])

        if(@paper.Done? || @paper.Doing? )
            render :json => @paper.to_json(:include => [:authors, :keywords, :figures])
        elsif(@paper.ToDo?)
            @paper.update(analized: :Doing)
            #pythonへのリクエスト
            url = URI.parse("https://analysis.catchapp.sudame.net/?paper_id=#{@paper.id}&paper_pdf_url=#{@paper.pdf_url}")
            res = Net::HTTP.get_response(url) 
            @paper.update(analized: :Done)
            render :json => @paper.to_json(:include => [:authors, :keywords, :figures])
        end
    end
    
    private

    def paper_params
        params.permit(:abstract,:abstract_ja,:title,:title_ja,:published_at,
        :cite_count,:cited_count,:journal,:pdf_url,:url)
    end

end
