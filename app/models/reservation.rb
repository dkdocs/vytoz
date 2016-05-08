class Reservation < ActiveRecord::Base
  enum status: [:pending, :confirmed, :hotel_cancelled, :user_cancelled]

  belongs_to :hotel
  belongs_to :table
  belongs_to :customer

  has_many :reservation_details

  def approve(table_ids)
  	self.update_attribute(:status :confirmed)

    arr = table_ids.split(',')
    details = []
    arr.each do | id |
      detail = { table_id: id }
      details.push( detail)
    end

    self.reservation_details.create( details)
    Table.where(details).update_all(:status => 1)
  end
end
