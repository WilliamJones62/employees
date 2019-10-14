class UserLoad < ApplicationRecord
  establish_connection "development".to_sym
  def self.import(file)
    UserLoad.delete_all
    CSV.foreach(file.path, headers: true) do |row|
      UserLoad.create! row.to_hash
    end
  end

end
