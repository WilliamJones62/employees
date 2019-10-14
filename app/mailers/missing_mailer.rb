class MissingMailer < ApplicationMailer
  default from: "andyw@dartagnan.com"

  def missing_photo_email(employee)
    @employee = employee

    mail(
      to: "#{employee.email}",
      subject: "Missing Employee Photo"
    )
  end
end
