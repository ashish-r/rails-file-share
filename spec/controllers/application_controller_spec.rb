require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
    context 'file_size_verbose' do
        it 'should return 1 KB for 1111 bytes' do
          expect(@controller.helpers.file_size_verbose 1111).to eq('1 KB')
        end
        it 'should return 1 MB for 1111111 bytes' do
            expect(@controller.helpers.file_size_verbose 1111111).to eq('1 MB')
        end
        it 'should return 1 MB for 1111111111 bytes' do
            expect(@controller.helpers.file_size_verbose 1111111111).to eq('1 GB')
        end
    end
    context 'current_user' do
        let (:user) { User.create({
            user_name: 'bond007apptest',
            full_name: 'James Bond',
            email: 'james@bond.com',
            password: 'validPwd123'
        }) }
        it 'should return nil if session not created' do
          expect(@controller.helpers.current_user).to be_nil
        end
        it 'should return user object if session created for user' do
            session[:user_id] = user.id
            expect(@controller.helpers.current_user).not_to be_nil
            expect(@controller.helpers.current_user).to eq(user)
        end
    end
end
