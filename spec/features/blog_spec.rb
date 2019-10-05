require 'rails_helper'

describe 'navigate' do
  let(:content) { 'foobar' }
  let(:user) do
    User.create(
      email: 'foo@bar.net',
      name: 'baz',
      password: 'chicken',
      password_confirmation: 'chicken'
    )
  end
  # could refactor later to use factories

  describe 'index' do
    it 'can be reached' do
      visit blogs_path
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Blogs' do
      visit blogs_path
      expect(page).to have_content(/Blogs/)
    end
  end

  describe 'creation' do
    before do
      login_as(user, scope: :user)
      visit new_blog_path
    end

    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from a new form' do

      fill_in 'blog[content]', with: 'words'
      click_on 'Save'

      expect(page).to have_content('words')
      expect(page).to have_content(user.name)
      expect(User.last.blogs.last.content).to have_content(/words/)
    end
  end

  describe 'edit' do
    xit 'can be edited' do

    end
  end

  describe 'deletion' do
    xit 'can be deleted' do

    end
  end
end
