class Product
  BASIC_TAX = 0.1
  IMPORT_TAX = 0.05
  IMPORTED_IDENTIFIER = 'imported'
  PRODUCTS_EXEMPT_FROM_BASIC_TAX = [
    'book',
    'chocolate bar',
    'box of chocolates',
    'headache pills',
    'packet of headache pills',
    'boxes of chocolates',
  ]

  attr_reader :price, :quantity

  def initialize(price, name, apply_import_tax, quantity)
    @price = price
    @name = name
    @quantity = quantity
    @apply_basic_tax = !PRODUCTS_EXEMPT_FROM_BASIC_TAX.include?(name)
    @apply_import_tax = apply_import_tax
  end

  def full_name
    return "#{IMPORTED_IDENTIFIER} #{@name}" if @apply_import_tax
    @name
  end

  def price_with_sales_tax
    (@price + sales_tax_per_item) * @quantity
  end

  def sales_tax
    sales_tax_per_item * @quantity
  end

  private

  def sales_tax_per_item
    round_up_to_nearest_point_zero_five(@price * sales_tax_percentage)
  end

  def sales_tax_percentage
    [@apply_basic_tax && BASIC_TAX, @apply_import_tax && IMPORT_TAX].select(&:itself).sum
  end


  def round_up_to_nearest_point_zero_five(float)
    ((float*20.0).ceil)/20.0
  end
end