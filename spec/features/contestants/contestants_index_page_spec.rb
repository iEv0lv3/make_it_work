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

  describe 'When I visit the contestants index page' do
    it 'I see a list of names of all the contestants and their projects' do
      visit '/contestants'

      expect(current_path).to eq('/contestants')

      within("div#contestant_#{@contestant1.id}") do
        expect(page).to have_content('Name: Jordan')
        expect(page).to have_content('Projects:')
        expect(page).to have_content('News Chic')
        expect(page).to have_content('Boardfit')
      end

      within("div#contestant_#{@contestant2.id}") do
        expect(page).to have_content('Name: Meredith')
        expect(page).to have_content('Projects:')
        expect(page).to have_content('News Chic')
        expect(page).to have_content('Boardfit')
      end

    end
  end
end
