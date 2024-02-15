require 'rails_helper'
RSpec.describe 'New Food', type: :system do
  let(:user) { create(:user) }
  before do
    sign_in user
    visit new_user_food_path(user)
  end
  it 'renders the form and back link' do
    expect(page).to have_selector('form')
    expect(page).to have_field('Name')
  end
end