class Backer

    attr_reader :name
    @@all = []

    def initialize name
        @name = name
        @@all << self
    end

    def back_project project
        ProjectBacker.new(project, self)
    end

    def self.all
        @@all 
    end

    def backed_projects
        backers = ProjectBacker.all.select do |backer|
            backer.backer == self
        end
        backers.map {|backer| backer.project}
    end

end