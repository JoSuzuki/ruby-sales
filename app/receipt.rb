class Receipt
  def initialize(products)
    @products = products
  end

  def print
    @products.each do |product|
      puts "#{product.quantity} #{product.full_name}: %.2f" % product.price_with_sales_tax
    end
    puts "Sales Taxes: %.2f" % calculate_sales_taxes
    puts "Total: %.2f" % calculate_total
  end

  private

  def calculate_total
    @products.sum{ |product| product.price_with_sales_tax }
  end

  def calculate_sales_taxes
    @products.sum{ |product| product.sales_tax }
  end
end
