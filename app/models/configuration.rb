class Configuration < ActiveRecord::Base

    serialize :value
    validates_presence_of :name
    validates_uniqueness_of :name, :case_sensitive => false


    def self.[](name)
        this_setting =  self.find_by_name(name.to_s)
        this_setting.nil? ? nil : this_setting.value
    end

    def self.[]=(name, value)
        this_setting = self.where(:name => name.to_s).first_or_create
        this_setting.value = value
        this_setting.save
        puts this_setting
        this_setting
    end

end
