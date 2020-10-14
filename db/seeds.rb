# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Country.count == 0
  Country.create!(
      name: 'El Salvador',
      code: 'Sv',
      symbol_currency: '$',
      currency_type: 'Dollar'
  )

  p 'COUNTRY CREATED'
end

if DocumentType.count == 0
  DocumentType.create!(
      doc_type: 'DUI'
  )
end

if Bank.count == 0
  Bank.create!(
      name: 'Banco agricola',
      country: Country.first
  )
end

if User.find_by(email: 'admin@admin.com').blank?
  User.create!(
      email: 'admin@admin.com',
      password: 'admin123',
      country: Country.first
  )
  p 'Added admin@admin.com'
else
  p 'User admin already exists'
end
