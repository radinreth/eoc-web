class Sop < ApplicationRecord
  include Sops::Searchable

  mount_uploader :file, FileUploader

  belongs_to :category, optional: true
  # serialize :tags

  validates :name, presence: true, uniqueness: true
  after_commit :remove_file!, on: :destroy

  def self.search_highlight(params)
    response = self.search(params)

    SopSearchResultPresenter.new(response).results
  end
end
