class Interest < ActiveRecord::Base

	has_and_belongs_to_many :people

    def self.get_or_create courses
      entitys = []
      courses.each do |course| 
        match = search(course)
        if match.present?
          entitys << match
        else
          entitys << Interest.create(name: course)
        end
      end
      return entitys.uniq
    end

    def self.search course
      interests = Interest.where("name ILIKE ? ","%#{course}%")
      interests.first
    end

end
