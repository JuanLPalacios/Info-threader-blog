require 'rails_helper'
RSpec.describe 'Posts' do
  describe 'GET #index', type: :request do
    before(:example) do
      get('/users/1/posts')
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders "index" template' do
      expect(response).to render_template('index')
    end

    it 'includes in response body correct placeholder text' do
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end

  describe 'GET #show', type: :request do
    before(:example) do
      get('/users/1/posts/1')
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders "show" template' do
      expect(response).to render_template('show')
    end

    it 'includes in response body correct placeholder text' do
      expect(response.body).to include('Here is the contents of a given post')
    end
  end
end
