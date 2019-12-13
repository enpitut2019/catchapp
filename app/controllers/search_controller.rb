require 'rexml/document'
require 'net/http'
require 'uri'

class SearchController < ApplicationController
    def get_xml
        # 検索ワードのエスケープ処理
        search_word = URI.encode_www_form_component(params['search_word'])
        
        # arXiv APIのエンドポイントURLを構築
        url = URI.parse("http://export.arxiv.org/api/query?search_query=abs:#{search_word}&start=0&max_results=30")

        # arXiv APIを叩いてデータを取得する
        res = Net::HTTP.get_response(url) ## 生のレスポンス
        body = res.body ## レスポンスボディはXMLとして得られる

        # 得られたXMLの解析
        papers = parseXML(body)

        # json形式でレスポンスを送る
        render(json: papers)
    end

    private
    # Google Translateで翻訳する関数
    def translate(content)
      url = URI.parse('https://www.googleapis.com/language/translate/v2')
      params = {
        q: content,
        target: "ja", # 翻訳したい言語
        source: "en", # 翻訳する言語の種類
        key: ENV["GOOGLE_CLOUD_API_KEY"]
      }
      url.query = URI.encode_www_form(params)
      res = Net::HTTP.get_response(url)
      json = res.body

      return JSON.parse(json)["data"]["translations"].first["translatedText"]
    end

    # arXiv APIから取得したXMLを解析してPaperモデルの配列を返す関数
    def parseXML(xmlString)
        # 返されるPaperの配列の準備
        papers = Array.new

        # XMLの解析
        doc = REXML::Document.new(xmlString)
        doc.elements.each('//entry') do |e|
            title = e.elements['title'] ? e.elements['title'].text : ''
            title_ja = translate(title)
            arxiv_id = e.elements['id'] ? e.elements['id'].text : ''
            abstract = e.elements['summary'] ? e.elements['summary'].text : ''
            abstract_ja = translate(abstract)
            url = e.elements['link[@type="text/html"]'] ? e.elements['link[@type="text/html"]'].attributes['href'] : ''
            url_pdf = e.elements['link[@type="application/pdf"]'] ? e.elements['link[@type="application/pdf"]'].attributes['href'] : ''
            published_at = e.elements['published'] ? e.elements['published'].text : ''
            journal = e.elements['arxiv:journal_ref'] ? e.elements['arxiv:journal_ref'].text : ''
            author_names = Array.new
            e.elements.each('author') do |authors_elements|
                author_name = authors_elements.elements['name'] ? authors_elements.elements['name'].text : ''
                author_names.push(author_name)
            end

            # Paperモデルへの保存
            ## PaperがDB上に既に存在するかどうか確認
            paper = Paper.find_by(:aixiv_id => arxiv_id)
            if paper.nil? then
              ## PaperがDBに存在しなければ保存してpaper変数を更新
              paper = Paper.create!(title: title, title_ja: title_ja, url: url, pdf_url: url_pdf, journal: journal, abstract: abstract, abstract_ja: abstract_ja, aixiv_id: arxiv_id, published_at: DateTime.parse(published_at))
              ## Authorsの保存
              author_names.map do |author_name|
                paper.authors.create!(name: author_name)
              end
            end
            # 生成or取得したPaperを配列に追加
            papers.push(paper)
        end

        # Paperの配列を返す
        return papers
    end
end
