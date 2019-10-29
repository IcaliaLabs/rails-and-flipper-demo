class Person < ApplicationRecord
  EMAIL_REGEXP = /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i

  validates_uniqueness_of :email,
                          allow_blank: true,
                          case_sensitive: true,
                          if: :will_save_change_to_email?

  validates_format_of :email,
                      with: EMAIL_REGEXP,
                      allow_blank: true,
                      if: :will_save_change_to_email?
end
