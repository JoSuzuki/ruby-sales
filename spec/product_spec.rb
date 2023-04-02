require_relative '../app/product'

RSpec.describe Product do

  IGNORE_FLOAT_POINT_ERRORS_FOR_NOW = 0.0001;

  subject { Product.new(price, name, apply_import_tax, quantity) }

  context 'Product is book, food or medical' do
    context 'imported' do
      let(:apply_import_tax) { true }

      context '3 imported boxes of chocolates at 11.25' do
        let(:price) { 11.25 }
        let(:name) { 'boxes of chocolates' }
        let(:quantity) { 3 }

        it 'should apply imported tax' do
          expect(subject.price_with_sales_tax).to eq(35.55)
          expect(subject.sales_tax).to be_within(IGNORE_FLOAT_POINT_ERRORS_FOR_NOW).of(1.8)
        end
      end
    end

    context 'national' do
      let(:apply_import_tax) { false }

      context '2 books at 12.49' do
        let(:price) { 12.49 }
        let(:name) { 'boxes of chocolates' }
        let(:quantity) { 2 }

        it 'should calculate price properly' do
          expect(subject.price_with_sales_tax).to eq(24.98)
          expect(subject.sales_tax).to eq(0)
        end
      end

      context '1 chocolate bar at 0.85' do
        let(:price) { 0.85 }
        let(:name) { 'boxes of chocolates' }
        let(:quantity) { 1 }

        it 'should calculate price properly' do
          expect(subject.price_with_sales_tax).to eq(0.85)
          expect(subject.sales_tax).to eq(0)
        end
      end
    end
  end

  context 'apply basic taxes' do
    context 'imported' do
      let(:apply_import_tax) { true }

      context '1 imported bottle of perfume at 27.99' do
        let(:price) { 27.99 }
        let(:name) { 'bottle of perfume' }
        let(:quantity) { 1 }

        it 'should apply imported tax' do
          expect(subject.price_with_sales_tax).to eq(32.19)
          expect(subject.sales_tax).to be_within(IGNORE_FLOAT_POINT_ERRORS_FOR_NOW).of(4.2)
        end
      end
    end

    context 'national' do
      let(:apply_import_tax) { false }

      context '1 music CD at 14.99' do
        let(:price) { 14.99 }
        let(:name) { 'music CD' }
        let(:quantity) { 1 }

        it 'should calculate price properly' do
          expect(subject.price_with_sales_tax).to be_within(IGNORE_FLOAT_POINT_ERRORS_FOR_NOW).of(16.49)
          expect(subject.sales_tax).to eq(1.5)
        end
      end

      context '1 bottle of perfume at 18.99' do
        let(:price) { 18.99 }
        let(:name) { 'bottle of perfume' }
        let(:quantity) { 1 }

        it 'should calculate price properly' do
          expect(subject.price_with_sales_tax).to be_within(IGNORE_FLOAT_POINT_ERRORS_FOR_NOW).of(20.89)
          expect(subject.sales_tax).to eq(1.9)
        end
      end
    end
  end
end