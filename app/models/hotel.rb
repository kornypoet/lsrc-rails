class Hotel < ActiveRecord::Base

  belongs_to      :city

  attr_accessible :name, :description, :city_id
  validates       :name, presence: true, length: { minimum: 2 }

  before_save     :ensure_capitalization

  def ensure_capitalization
    self.name = self.name.titlecase
  end

  class << self

    def yet_to_visit
      where(visited: false)
    end

  end

end
