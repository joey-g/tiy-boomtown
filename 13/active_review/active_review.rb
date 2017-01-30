require 'active_record'

ActiveRecord::Base.establish_connection(
    adapter: 'sqlserver',
    host: ENV['DB_HOST'],
    database: ENV['DB_NAME'],
    username: ENV['DB_USERNAME'],
    password: ENV['DB_PASSWORD']
)

class Contact < ActiveRecord::Base
  self.table_name = 'dbo.Contact'

  has_many :contact_users, foreign_key: 'ContactID'
  has_many :users, through: :contact_users
end

class ContactUser < ActiveRecord::Base
  self.table_name = 'dbo.ContactUser'

  belongs_to :contact, foreign_key: 'ContactID'
  belongs_to :user, foreign_key: 'UserID'
end

class User < ActiveRecord::Base
  self.table_name = 'dbo.User'

  has_many :contact_users, foreign_key: 'UserID'
  has_many :contacts, through: :contact_users
end

class Tenant < ActiveRecord::Base
  self.table_name = 'dbo.Tenant'

  has_many :users, foreign_key: 'TenantID'
end

users_leads = User.first.contacts
users_leads.each { |l| puts l.FirstName }