# Since we're using backbone, we need turn off the AR feature that wraps
# ActiveRecord data in an extra json layer. More info on this here,
# http://backbonejs.org/#FAQ-rails
# 
ActiveRecord::Base.include_root_in_json = false