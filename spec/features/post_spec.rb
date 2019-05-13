require 'rails_helper'

describe 'navigate' do 
  
  before do
     @user = FactoryGirl.create(:user)
    # @user = User.create(first_name: "Jon", last_name: "Snow", email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf")
    login_as(@user, :scope => :user)
  end

  describe 'index' do

    before do
      visit posts_path
    end
    
    it 'can be reached succesfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of posts' do
      expect(page).to have_content(/Posts/)
    end
    
    it 'has a list of posts' do
      post1 = FactoryGirl.build_stubbed(:post)
      post2 = FactoryGirl.build_stubbed(:second_post)
      visit posts_path
      expect(page).to have_content(/Rationale|content/)
    end

  end

  describe 'creation' do
    
    before do
      visit new_post_path
    end

    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Some rationale"

      click_on 'Save'

      expect(page).to have_content("Some rationale")
    end

    it 'will have a user associated with it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User Association"
      click_on 'Save'

      expect(User.last.posts.last.rationale).to eq("User Association")
    end
  end

  describe 'edit' do

    before do
      @post = FactoryGirl.create(:post)
    end

    it 'can be reached by clicking edit on index page' do
      visit posts_path

      click_link "edit_#{@post.id}"
      expect(page.status_code).to eq(200)
    end

    it 'can be edited' do
      visit edit_post_path(@post)

      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Edited content"

      click_on 'Save'
    end

  end

end
