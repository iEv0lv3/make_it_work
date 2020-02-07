class Project <ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def average_experience(project)
    project.contestants.average(:years_of_experience).round(2)
  end
end
