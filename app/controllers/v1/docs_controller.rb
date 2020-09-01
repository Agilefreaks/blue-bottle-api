module V1
  class DocsController < ActionController::API
    include ActionController::MimeResponds
    include DocsConcern

    add_to_doc_section(ApiVersion::V1_DOCS)

    swagger_root swagger: '2.0' do
      info version: '1.0', title: 'Blue Bottle API V1', description: 'API for Blue Bottle Coffee Lovers.'
      key :host, Rails.configuration.x.hostname
      key :basePath, ''
      key :consumes, ['application/json']
      key :produces, ['application/json']
      key :schemes, %w(http https)
    end

    def index
      respond_to do |format|
        format.html { redirect_to_docs_viewer(v1_docs_path(format: :json)) }
        format.json { render_docs(ApiVersion::V1_DOCS) }
      end
    end
  end
end
