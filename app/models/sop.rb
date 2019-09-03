class Sop < ApplicationRecord
  mount_uploader :file, FileUploader

  belongs_to :category, optional: true
  # serialize :tags

  validates :name, presence: true, uniqueness: true
  after_commit :remove_file!, on: :destroy
end
