task :user_loads => :environment do
  Employee.load_ssn4
end
