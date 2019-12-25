class Task < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true
    validates :is_done, inclusion: { in: [true, false] }
    has_many :comments, dependent: :destroy
    belongs_to :assignee, class_name: 'User', optional: true
    belongs_to :user
end
