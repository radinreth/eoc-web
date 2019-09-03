class Sop < ApplicationRecord
  mount_uploader :file, FileUploader

  belongs_to :category, optional: true
  serialize :tags
end
