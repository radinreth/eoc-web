require 'elasticsearch/model'

module Sops::Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    def self.search(params)
      return self.__elasticsearch__.search({query: {match_all: {}}}) if params[:keyword].blank?

      highlight_options = {
                            fragment_size: 180,
                            number_of_fragments: 2,
                          }
      highlight = {
        pre_tags: ["<em class='highlight'>"],
        post_tags: ["</em>"],
        fields: {
          name: {},
          tags: {}
        }
      }

      self.__elasticsearch__.search({
        query: {
          multi_match: {
            query: params[:keyword],
            fields: ['name', 'tags']
          }
        },
        highlight: highlight
      })
    end
  end
end
