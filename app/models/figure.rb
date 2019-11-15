class Figure < ApplicationRecord
    belongs_to :paper
    mount_uploader :figure, PaperImageUploader
end
