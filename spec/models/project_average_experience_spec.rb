require 'rails_helper'

RSpec.describe Project, type: :model do
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

  describe 'average age instance method'do
    it 'averages the experience of contestants' do
      expect(@news_chic_project.average_experience(@news_chic_project)).to eq(8.0)
      expect(@boardfit_project.average_experience(@news_chic_project)).to eq(8.0)
    end
  end
end
