class Keyword < ApplicationRecord
	has_many :paper_keywords
	has_many :papers, through: :paper_keywords
	accepts_nested_attributes_for :paper_keywords
end
