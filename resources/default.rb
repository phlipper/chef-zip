actions :extract
default_action :extract

attribute :name, :kind_of => String, :name_attribute => true, :required => true
attribute :owner, :kind_of => String, :default => "root"
attribute :group, :kind_of => String, :default => "root"
attribute :path, :kind_of => String, :default => "."
attribute :source, :kind_of => String

attr_accessor :exists

