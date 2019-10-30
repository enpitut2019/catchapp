class Paper < ApplicationRecord
	has_many :paper_authors
	has_many :paper_keywords
	has_many :authors, through: :paper_authors
	has_many :keywords, through: :paper_keywords
	accepts_nested_attributes_for :paper_authors
	accepts_nested_attributes_for :paper_keywords
end
