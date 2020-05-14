require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    context 'User not logged in' do 
        let (:user) { session[:user_id] = nil }
        it 'users#new should return signup form' do 
            get :new
            expect(response).to be_successful
        end 
        it 'users#show should redirect to login' do 
            get :show
            expect(response).to redirect_to('/login')
        end
        it 'users#create should create account and redirect home if params correct' do 
            post :create, params: { user: { 
                user_name: "test_user107", 
                full_name: "a r", 
                email: 'a@r.c', 
                password: 'strongPwd123' } 
            }, as: :json
            expect(response).to redirect_to('/')
        end
        it 'users#edit should redirect to login' do 
            get :edit
            expect(response).to redirect_to('/login')
        end
        it 'users#update should redirect to login' do 
            patch :update
            expect(response).to redirect_to('/login')
        end
    end
    context 'User logged in' do 
        let (:user) { 
            user = User.create({
                user_name: 'bond007apptest',
                full_name: 'James Bond',
                email: 'james@bond.com',
                password: 'validPwd123'
            }) 
        }
        it 'users#new should redirect to home' do 
            session[:user_id] = user.id
            get :new
            expect(response).to redirect_to('/')
        end
        it 'users#show should display profile' do 
            session[:user_id] = user.id
            get :show
            expect(response).to be_successful
        end
        it 'users#edit should display edit form' do 
            session[:user_id] = user.id
            get :edit
            expect(response).to be_successful
        end
    end
end
