module ProjectsHelper
  def self.import_yaml_hash hash, project, currentkey
    cur = currentkey
    hash.each_pair do |k, v|
      if(v.is_a? Hash)
        import_yaml_hash v, project, cur+k+':'
      else
        Word.create_word cur+k, v, project, project.language
      end
    end
  end

  def filter_options
    [
        ['Show Untranslated', 'untranslated'],
        ['Show Translated', 'translated']
    ]
  end

  def self.language_to_yaml_hash word
    hash = Hash.new;
    if word.has_children?
       word.children.each do |child|
         hash[child.key.rpartition(':')[2]] = language_to_yaml_hash child
       end
      return hash
    else
      return word.text
    end
  end
end
