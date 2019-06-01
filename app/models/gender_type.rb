class GenderType < ActiveYaml::Base
  include ActiveHash::Enum

  set_root_path 'config/classification'
  set_filename 'gender_type'

  enum_accessor :gender_type
end
