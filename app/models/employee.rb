class Employee < ApplicationRecord
  mount_uploader :image, ImageUploader

  def self.import(file)
    Employee.delete_all
    CSV.foreach(file.path, headers:true) do |row|
      Employee.create! row.to_hash
    end
  end

  def name
    "#{Firstname} #{Lastname}"
  end

  def send_emails!
    employees = []
    employees = Employee.where(Badge_No: "719987")
    # all_employees = Employee.all
    # all_employees.each do |e|
    #   if e.image.blank?
    #     # missing photo
    #     employees.push(e)
    #   end
    # end
    employees.each do |e|
      MissingMailer.missing_photo_email(e).deliver_later
    end
  end

  def self.load_ssn4
    all.each do |p|
      if !p.Badge_.blank? && p.ssn4.blank?
        # get SSN4 for an employee with a badge but no SSN4
        u = UserLoad.find_by badge: p.Badge_
        if !u.blank?
          p.ssn4 = u.ssn4
          p.save
        end
      end
    end
  end

end
