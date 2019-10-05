require 'rails_helper'

RSpec.describe BlogsController, type: :controller do

  let(:content) { 'foobar' }
  let(:user) do
    User.create(
      email: 'foo@bar.net',
      password: 'chicken',
      password_confirmation: 'chicken'
    )
  end
  let(:blog) do
    Blog.create(
      user_id: user.id,
      content: content
    )
  end

  describe 'GET index' do
    it 'exists and responds' do
      get :index

      expect(response.status).to eq(200)
    end

    it 'assigns @blogs' do
      blog
      get :index
      expect(assigns(:blogs)).to eq([blog])
    end

    it 'works with many records' do
      100.times do
        Blog.create(
          user_id: user.id,
          content: content
        )
      end

      get :index
      expect(assigns(:blogs).count).to eq(100)
    end
  end

  describe 'GET show' do
    it 'exists and responds' do
      get :show, params: {id: blog.id}

      expect(response.status).to eq(200)
    end
  end

  describe 'GET edit' do
    it 'exists and responds' do
      get :edit, params: {id: blog.id}

      expect(response.status).to eq(200)
    end
  end

  describe 'GET new' do
    it 'exists and responds' do
      get :new

      expect(response.status).to eq(200)
    end
  end

  describe 'POST create' do
    it 'adds a record' do
      sign_in user
      post :create, params: {blog: {content: content}}

      expect(Blog.count).to eq(1)
      expect(Blog.first.content).to eq(content)
    end

    it 'won\'t add a record if content is nil' do
      sign_in user
      post :create, params: {blog: {content: nil}}

      expect(Blog.count).to eq(0)
    end
  end

  describe 'PUT update' do
    it 'modifies a record' do
      put :update, params: { id: blog.id, blog: { content: 'new content' } }

      expect(Blog.count).to eq(1)
      expect(Blog.first.content).to eq('new content')
    end
  end

  describe 'DELETE destroy' do
    it 'deletes a record' do
      delete :destroy, params: {id: blog.id}

      expect(Blog.count).to eq(0)
    end
  end

end
