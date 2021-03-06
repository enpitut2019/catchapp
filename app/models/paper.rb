class Paper < ApplicationRecord
	validates_uniqueness_of :arxiv_id
	has_many :figures
	has_many :paper_authors
	has_many :paper_keywords
	has_many :authors, through: :paper_authors
	has_many :keywords, through: :paper_keywords
	accepts_nested_attributes_for :paper_authors
	accepts_nested_attributes_for :paper_keywords
	enum analized: { ToDo: 0, Doing: 1, Done:2}
end
