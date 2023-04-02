require_relative 'data_source'
require_relative 'receipt'

def main
  products = DataSource.get_products
  receipt = Receipt.new(products)

  receipt.print
end

main