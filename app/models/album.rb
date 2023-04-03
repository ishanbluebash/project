class Album < ApplicationRecord
    def self.ransackable_attributes(auth_object = nil)
        ["body", "created_at", "id", "published", "song", "title", "updated_at"]
      end
    has_many_attached :audios
    has_one_attached  :image
    validates :title, presence: true
    validates :song, presence: true
    validates :body, presence: true, length: { minimum: 10 }
end
