require 'rails_helper'

RSpec.describe 'New Food', type: :system do
  let(:user) { FactoryBot.create(:user, confirmed_at: Time.zone.now) }

  before do
    sign_in user
  end

  it 'renders the form and back link' do
    visit new_user_food_path(user)
    expect(page).to have_selector('form')
    expect(page).to have_field('Name')
  end
end
