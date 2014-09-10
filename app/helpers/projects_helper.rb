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
end
