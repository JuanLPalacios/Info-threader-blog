require 'rails_helper'
require "capybara/rspec"
RSpec.describe 'Users' do
    describe 'GET #index', type: :request do
        before(:example) do
            get('/users')
        end

        it "is a success" do
            expect(response).to have_http_status(:ok)
        end

        it "renders 'index' template" do
            expect(response).to render_template('index')
        end
        
        it "Visiting the home page" do
          expect(response.body).to include('Here is a list of users')
        end
    end

end