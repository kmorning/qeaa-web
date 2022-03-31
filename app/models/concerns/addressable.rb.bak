module Addressable
  extend ActiveSupport::Concern

  included do
    geocoded_by :address
    after_validation :geocode,
      if: ->(obj){ obj.address_present? and obj.address_changed? }

    enum province: [:ab,
                    :bc,
                    :mb,
                    :nb,
                    :nl,
                    :ns,
                    :nt,
                    :nu,
                    :on,
                    :pe,
                    :qc,
                    :sk,
                    :yt]
  end

  def address
    if postal_code.blank?
      [street, city, province.upcase].compact.join(', ')
    else
      [street, city, province.upcase, postal_code].compact.join(', ')
    end
  end

  def address_present?
    self.street.present? and self.city.present? and self.province.present?
  end

  def address_changed?
    self.street_changed? or self.city_changed? or self.province_changed? or
      self.postal_code_changed?
  end

  def marker
    {
      lat: self.latitude,
      lng: self.longitude
    }
  end
end

