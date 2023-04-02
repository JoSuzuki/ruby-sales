require_relative '../app/receipt'
require_relative '../app/product'

RSpec.describe Receipt do

  subject { Receipt.new(products).print }

  context 'input_01.txt' do
    let(:products) { [
      Product.new(12.49, 'book', false, 2),
      Product.new(14.99, 'music CD', false, 1),
      Product.new(0.85, 'chocolate bar', false, 1),
    ]}

    it "prints the correct receipt" do
      expect do
        subject
      end.to output(a_string_including("2 book: 24.98
1 music CD: 16.49
1 chocolate bar: 0.85
Sales Taxes: 1.50
Total: 42.32")).to_stdout
    end
  end

  context 'input_02.txt' do
    let(:products) { [
      Product.new(10.0, 'box of chocolates', true, 1),
      Product.new(47.5, 'bottle of perfume', true, 1),
    ]}

    it "prints the correct receipt" do
      expect do
        subject
      end.to output(a_string_including("1 imported box of chocolates: 10.50
1 imported bottle of perfume: 54.65
Sales Taxes: 7.65
Total: 65.15")).to_stdout
    end
  end

  context 'input_03.txt' do
    let(:products) { [
      Product.new(27.99, 'bottle of perfume', true, 1),
      Product.new(18.99, 'bottle of perfume', false, 1),
      Product.new(9.75, 'packet of headache pills', false, 1),
      Product.new(11.25, 'boxes of chocolates', true, 3),
    ]}

    it "prints the correct receipt" do
      expect do
        subject
      end.to output(a_string_including("1 imported bottle of perfume: 32.19
1 bottle of perfume: 20.89
1 packet of headache pills: 9.75
3 imported boxes of chocolates: 35.55
Sales Taxes: 7.90
Total: 98.38")).to_stdout
    end
  end

end