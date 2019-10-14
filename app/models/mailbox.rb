class Mailbox < ApplicationRecord
  establish_connection "mailbox".to_sym

    def self.import(file)
      Mailbox.delete_all
      CSV.foreach(file.path, headers:true) do |row|
        Mailbox.create! row.to_hash
      end
    end

end
