class Document < ApplicationRecord
    belongs_to :user
    has_one_attached :user_document
    validates :key, presence: true, uniqueness: true
end
