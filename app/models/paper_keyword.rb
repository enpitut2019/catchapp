class PaperKeyword < ApplicationRecord
  belongs_to :paper
  belongs_to :keyword
end
