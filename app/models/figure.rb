class Figure < ApplicationRecord
    belongs_to :paper
    mount_uploader :figure, PaperImageUploader

    # 非推奨
    # ToDo: フロントが対応次第削除する
    def explanation
        self.caption
    end
end
