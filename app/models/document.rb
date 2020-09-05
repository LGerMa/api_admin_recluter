class Document < ApplicationRecord
  belongs_to :documentable, polymorphic: true

  enum document_type: { dui: 0, passport: 1, nit: 2}
end
