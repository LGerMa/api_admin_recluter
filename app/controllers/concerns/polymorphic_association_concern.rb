module PolymorphicAssociationConcern extend ActiveSupport::Concern
def getKlass
  type = ''
  value = ''
  if params[:candidate_id]
    type = 'candidate'
    value = params[:candidate_id]
  elsif params[:company_id]
    type = 'company'
    value = params[:company_id]
  end
  klass = type.capitalize.constantize
  {'klass' => klass, 'value' => value}
end

end