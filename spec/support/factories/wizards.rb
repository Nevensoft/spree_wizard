FactoryGirl.define do 
  factory :wizard, class: Spree::Wizard do
    name 'complete package'
    permalink 'complete'
    taxons { [FactoryGirl.create(:taxon), 
                FactoryGirl.create(:taxon)] }
  end
end
