require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  before :each do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

    @news_chic_project = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @boardfit_project = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

    @contestant1 = @news_chic_project.contestants.create(name: 'Jordan',
                                                         age: 37,
                                                         hometown: 'Portland',
                                                         years_of_experience: 1
                                                        )

    @contestant2 = @news_chic_project.contestants.create(name: 'Meredith',
                                                         age: 37,
                                                         hometown: 'New York',
                                                         years_of_experience: 15
                                                        )

    @boardfit_project.contestants << @contestant1

    @boardfit_project.contestants << @contestant2
  end

  describe 'When I visit a project show page' do
    it 'it shows the average age of contestants on that project' do
      visit "/projects/#{@news_chic_project.id}"

      expect(current_path).to eq("/projects/#{@news_chic_project.id}")
      expect(page).to have_content('Project: News Chic')
      expect(page).to have_content('Material: Newspaper')
      expect(page).to have_content('Theme: Recycled Material')
      expect(page).to have_content('Number of Contestants: 2')
      expect(page).to have_content('Average Contestant Experience: 8')
    end
  end
end
