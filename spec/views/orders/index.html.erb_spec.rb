require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
        :order_number => "Order Number",
        :delivery_date => "Delivery Date"
      ),
      Order.create!(
        :order_number => "Order Number",
        :delivery_date => "Delivery Date"
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", :text => "Order Number".to_s, :count => 2
    assert_select "tr>td", :text => "Delivery Date".to_s, :count => 2
  end
end
