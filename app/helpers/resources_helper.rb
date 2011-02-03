module ResourcesHelper
  def levels_json_string
    # some funky Array->Hash conversion, courtesy of http://snippets.dzone.com/posts/show/302
    # Hash[*LEVELS.collect{|l| [l,l]}.flatten].to_json
    
    # TODO move this logic to jeditable-rails
    levels_pairs = ["'': 'Select level...'"]
    levels_pairs.concat LEVELS.collect{|l| "\"#{l}\": \"#{l}\""}
    "{#{levels_pairs.join(', ')}}"
  end
end
