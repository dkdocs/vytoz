class OrderItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :quantity


  def name 
    self.menu_item.name
  end
 
end

