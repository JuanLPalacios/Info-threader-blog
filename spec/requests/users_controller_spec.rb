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
  end
end
