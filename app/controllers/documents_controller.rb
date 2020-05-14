require 'securerandom'

class DocumentsController < ApplicationController
    before_action :require_user, except: [:show]

    def index
        @documents = current_user.documents.sort_by(&:created_at).reverse
    end

    def create
        current_user.documents.create(create_document_params)
        redirect_to '/'
    end

    def show
        @document = Document.find_by(key: params[:id], shared: true)
        @user = User.find(@document[:user_id]) if @document
    end

    def update
        @checked = (params[:document] && (params[:document][:shared] == '1')) ? true : false
        @document = current_user.documents.find_by_key(params[:id])
        @document && @document.update(shared: @checked) 
        redirect_to '/'
    end

    def destroy
        @document = current_user.documents.find_by_key(params[:id])
        @document && @document.user_document.purge_later
        @document && @document.destroy
        redirect_to '/'
    end

    private
    def create_document_params
        params.require(:document).permit(:user_document).merge(key: "#{SecureRandom.hex(6)}#{Time.now.to_i}")
    end
end
