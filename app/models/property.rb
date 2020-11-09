class Property < ApplicationRecord
  has_many :stations, dependent: :destroy
  accepts_nested_attributes_for :stations, allow_destroy: true, reject_if: :reject_both_blank

  def reject_both_blank(attributes)
    if attributes[:id]
      attributes.merge!(_destroy: "1") if attributes[:route].blank? and attributes[:name].blank? and attributes[:minute].blank?
      !attributes[:route].blank? and attributes[:name].blank? and attributes[:minute].blank?
    else
      attributes[:route].blank? and attributes[:name].blank? and attributes[:minute].blank?
    end
  end

end
