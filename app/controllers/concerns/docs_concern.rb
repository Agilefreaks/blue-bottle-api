# frozen_string_literal: true

require 'weak_swagger_parameters'

module DocsConcern
  extend ActiveSupport::Concern

  included do
    include WeakSwaggerParameters::Controller

    def redirect_to_docs_viewer(docs_path)
      redirect_to swagger_path(docs_path)
    end

    def ensure_loaded
      Dir['./app/controllers/**/*_controller.rb'].each do |path|
        require path.chomp('.rb')
      end
    end

    private

      def swagger_path(url)
        "/swagger/index.html?url=#{url}"
      end
  end
end
