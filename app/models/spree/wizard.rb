module Spree
  class Wizard < ActiveRecord::Base
    attr_accessible :name

    has_many :wizard_taxons
    has_many :taxons, through: :wizard_taxons
  end
end