require 'rails_helper'


RSpec.describe 'walks/index.html.erb', type: :view do
  before do
    # test data
    user = FactoryBot.create(:user)
    dog = FactoryBot.create(:dog, user: user)
    @walk1 = FactoryBot.create(:walk, difficulty: "facile", duration: 30, distance: 2.5, title: "Park Walk")
    @walk2 = FactoryBot.create(:walk, difficulty: "difficile", duration: 45, distance: 5.0, title: "Forest Hike")

    sign_in user
    params[:dog_id] = dog.id
    assign(:walks, [@walk1, @walk2]) # Assign the walks to the view
    assign(:dog, dog) # Assign the dog to the view
  end

  it 'displays the filter link as active when the filter is applied' do
    # Render the view with a filter on
    params[:difficulty] = "facile"
    render
    # Add your expectations to check if the filter link is displayed as active
    expect(rendered).to have_css('.filter-link.active', text: 'Facile')
    expect(rendered).not_to have_css('.active', text: 'Difficile')
  end

  it 'displays the filter link as inactive when the filter is not applied' do
    # Render the view
    render

    # Add your expectations to check if the filter link is displayed as inactive
    expect(rendered).to have_css('.filter-link', text: 'Facile')
    expect(rendered).not_to have_css('.filter-link.active', text: 'Facile')
  end
end
