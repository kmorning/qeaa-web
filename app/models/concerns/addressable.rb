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
    [street, city, province.upcase].compact.join(', ')
  end

  def address_present?
    self.street.present? and self.city.present? and self.province.present?
  end

  def address_changed?
    self.street_changed? and self.city_changed? or self.province_changed?
  end
end

