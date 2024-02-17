require 'rails_helper'
RSpec.describe 'Foods Index view', type: :system do
  let(:user) { FactoryBot.create(:user, confirmed_at: Time.zone.now) }
  let!(:foods) { FactoryBot.create_list(:food, 2, user:) }

  before do
    sign_in user
  end

  it 'displays all foods' do
    visit user_foods_path(user)
    foods.each do |food|
      expect(page).to have_content(food.name)
      expect(page).to have_content(food.measurement_unit)
    end
  end

  it 'has button delete' do
    visit user_foods_path(user)
    expect(page).to have_content('Delete')
  end
end
