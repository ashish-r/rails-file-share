require 'rails_helper'

RSpec.describe DocumentsController, type: :controller do
    context 'User not logged in' do 
        it 'documents#show should display file' do 
            session[:user_id] = nil
            get :show, params: { id: 'asdadaasdqweq' }
            expect(response).to be_successful
        end 
        it 'documents#index should return login form' do 
            session[:user_id] = nil
            get :index
            expect(response).to redirect_to('/login')
        end 
        it 'documents#create should return login form' do 
            session[:user_id] = nil
            post :create
            expect(response).to redirect_to('/login')
        end 
        it 'documents#update should return login form' do 
            session[:user_id] = nil
            patch :update, params: { id: 'asdadaasdqweq' }
            expect(response).to redirect_to('/login')
        end 
        it 'documents#destroy should return login form' do 
            session[:user_id] = nil
            delete :destroy, params: { id: 'asdadaasdqweq' }
            expect(response).to redirect_to('/login')
        end 
        
    end
    context 'User logged in' do 
        let (:user) { 
            User.create({
                user_name: 'b7documentstest',
                full_name: 'James Bond',
                email: 'james@bond.com',
                password: 'validPwd123'
            }) 
        }
        it 'documents#index should return home page' do 
            session[:user_id] = user.id
            get :index
            expect(response).to be_successful
        end 
        it 'documents#create should add new document ' do 
            session[:user_id] = user.id
            post :create, params: { document: { 
                user_document: {} } 
            }, as: :json
            expect(response).to redirect_to('/')
        end 
        it 'documents#update should update is shared and redirect to homepage' do 
            session[:user_id] = user.id
            patch :update, params: { id: 'asdadaasdqweq', document: { shared: "1"} }
            expect(response).to redirect_to('/')
        end 
        it 'documents#destroy should return login form' do 
            session[:user_id] = user.id
            delete :destroy, params: { id: 'asdadaasdqweq' }
            expect(response).to redirect_to('/')
        end 
    end
end
