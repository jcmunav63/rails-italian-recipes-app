require 'rails_helper'
RSpec.describe 'Foods Index view', type: :system do
  let(:user) { create(:user) }
  let!(:foods) { create_list(:food, 2, user:) }
  before do
    sign_in user
    visit user_foods_path(user)
  end
  it 'displays all foods' do
    foods.each do |food|
      expect(page).to have_content(food.name)
      expect(page).to have_content(food.measurement_unit)
    end
  end
  it 'has button delete' do
    expect(page).to have_content('Delete')
  end
end
