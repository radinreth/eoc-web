require 'elasticsearch/model'

module Sops::Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    # include Elasticsearch::Model::Callbacks

    def self.fileter(params)
      response = params[:keyword].present? ? self.__elasticsearch__.search(params[:keyword]) : self.__elasticsearch__.all
      response.records.to_a
    end
  end
end
