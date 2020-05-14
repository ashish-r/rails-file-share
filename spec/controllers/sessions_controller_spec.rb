require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
    let (:user) { 
        User.create({
            user_name: 'b007sessiontest',
            full_name: 'James Bond',
            email: 'james@bond.com',
            password: 'validPwd123'
        }) 
    }
    context 'User not logged in' do 
        it 'sessions#new should return login form' do 
            session[:user_id] = nil
            get :new
            expect(response).to be_successful
        end 
        it 'sessions#create should create account and redirect home if params correct' do 
            post :create, params: { session: { 
                user_name: user.user_name,
                password: user.password } 
            }, as: :json
            expect(response).to redirect_to('/')
        end
    end
    context 'User logged in' do 
        it 'sessions#new should redirect to home' do 
            session[:user_id] = user.id
            get :new
            expect(response).to redirect_to('/')
        end
        it 'sessions#destroy should logout and redirect to login' do 
            session[:user_id] = user.id
            delete :destroy
            expect(response).to redirect_to('/login')
        end
    end

end
