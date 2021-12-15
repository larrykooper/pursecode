require 'rails_helper'

# RSpec.describe "Orders", type: :request do
#   describe "GET /orders/456.json" do
#     it "works! (now write some real specs)" do
#       get orders_path
#       expect(response).to have_http_status(200)
#     end
#   end
# end

describe "post an order route", :type => :request do
  before do
    post '/orders/1.json', params: {  :order_number => '123-1234567-1234567', :delivery_date => '2021-05-13' }
  end
  it 'returns the order' do
    expect(JSON.parse(response.body)['order_number']).to eq('123-1234567-1234567')
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
end
