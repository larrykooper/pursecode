require 'rails_helper'

RSpec.describe "orders/show", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      :order_number => "Order Number",
      :delivery_date => "Delivery Date"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Order Number/)
    expect(rendered).to match(/Delivery Date/)
  end
end
