class Favorite < ApplicationRecord
  belongs_to :user

  def asteroid
    new_search = AsteroidSearch.new(self.neo_reference_id)
    info = new_search.info
    Asteroid.new(info)
  end

end
