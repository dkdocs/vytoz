class Reservation < ActiveRecord::Base
  enum status: [:pending, :confirmed, :hotel_cancelled, :user_cancelled]

  belongs_to :hotel
  belongs_to :customer

  has_many :reservation_details

  after_update :change_status if :allowed_change?

  def approve (table_ids)
    self.update(:status => :confirmed)

    arr = table_ids.split(',')
    details = []
    arr.each do | id |
      detail = { table_id: id }
      details.push( detail)
    end

    self.reservation_details.create( details)
    Table.where(id: arr).update_all(:status => true)
  end


  def self.details(params)
  	binding.pry
  	details = self.where("hotel_id = ? AND from <= ? AND to >= ?", params[:hotel_id], params[:from], params[:to])
  end

  private

  def change_status
    ids = self.reservation_details.pluck(:table_id)

    Table.where(id: ids).update_all(:status => false)
  end

  def allowed_change?
    self.status_changed?(from: [:pending , :confirmed] , to: [:hotel_cancelled, :user_cancelled])
  end
end
