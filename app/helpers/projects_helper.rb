module ProjectsHelper
  def self.import_yaml_hash hash, project, currentkey
    cur = currentkey
    hash.each_pair do |k, v|
      if(v.is_a? Hash)
        cur += k+':'
        import_yaml_hash v, project, cur
      else
        cur += k
        Word.create_word cur, v, project, project.language
      end
    end
  end
end
