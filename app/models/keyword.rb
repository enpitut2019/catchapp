class Keyword < ApplicationRecord
	has_many :paper_keywords
	has_many :papers, through: :paper_keywords
end
