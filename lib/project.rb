require 'pry'

class Project 

    attr_reader :title
    @@all = []

    def initialize title
        @title = title
        @@all << self
    end

    def add_backer backer
        ProjectBacker.new(self, backer)
    end
    
    def backers
        projects = ProjectBacker.all.select do |backer|
            backer.project == self
        end
        projects.map {|project| project.backer}
    end

    def self.all
        @@all
    end
end
