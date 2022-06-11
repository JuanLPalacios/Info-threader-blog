require 'rails_helper'
RSpec.describe 'Users' do
  describe 'GET #index', type: :request do
    before(:example) do
      get('/users')
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders "index" template' do
      expect(response).to render_template('index')
    end

    it 'includes in response body correct placeholder text' do
      expect(response.body).to include('Here is a list of users')
    end
  end

  describe 'GET #show', type: :request do
    before(:example) do
      get('/users/1')
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders "show" template' do
      expect(response).to render_template('show')
    end

    it 'includes in response body correct placeholder text' do
      expect(response.body).to include('Here is the details of a a given user')
    end
  end
end
