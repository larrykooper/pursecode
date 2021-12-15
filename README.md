# Purse Coding

## Database

Database will contain these columns

orders table
id
order_number
delivery_date

## REST Endpoints

POST /orders.json
  Body will contain the order number and delivery date
  Creates and saves order with that number
  Returns error if order already exists

GET /orders/456.json
  Retrieves order 456
  Returns error if order 456 does not exist


