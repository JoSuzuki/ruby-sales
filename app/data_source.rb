require_relative 'product'

class DataSource
  def self.get_products
    puts "Enter input file name"
    file_name = gets.chomp
    file_lines = read_file_from_inputs_folder(file_name)
    products = map_file_lines_to_products(file_lines)
    products
  end

  private

  def self.read_file_from_inputs_folder(file_name)
    file = File.open("#{File.dirname(__FILE__)}/../inputs/#{file_name}")
    lines = file.readlines.map(&:chomp)
    file.close
    lines
  end

  def self.map_file_lines_to_products(lines)
    products = []
    lines.each do |line|
      line_array = line.split(" ")
      quantity = line_array.first.to_i
      index_of_at = line_array.index("at")
      imported = line_array[1] == Product::IMPORTED_IDENTIFIER
      product_name = line_array[(imported ? 2 : 1)...index_of_at].join(" ")
      price = line_array[index_of_at + 1].to_f
      products << Product.new(price, product_name, imported, quantity)
    end
    products
  end
end