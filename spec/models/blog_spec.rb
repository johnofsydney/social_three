  require 'rails_helper'

  RSpec.describe Blog, type: :model do

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

  describe 'association' do
    it { is_expected.to belong_to :user }
  end

  describe 'creation' do
    it 'can be created' do
      expect(blog).to be_valid
      expect(Blog.count).to eq(1)
      expect(Blog.first.user_id).to eq(user.id)
    end
  end

  context 'with no content' do
    let(:content) { nil }

    it 'is not created' do
      expect(blog).to_not be_valid
      expect(blog.errors[:content]).to include('can\'t be blank')
      expect(Blog.count).to eq(0)
    end
  end

  context 'with no user' do
    let(:user) { nil }

    it 'is not created' do
      expect{blog}.to raise_error(NoMethodError)
      # in this example we raise an error:
      # undefined method `id' for nil:NilClass
      # RSpec will complain if you don't check for specific errors
    end
  end

  describe 'deletion' do
    it 'can be deleted' do
      blog.destroy
      expect(Blog.count).to eq(0)
    end
  end
  end
