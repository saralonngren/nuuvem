require 'rails_helper'

RSpec.describe ImportSaleService do
  context 'run' do 
    subject(:service) { described_class.new(file) }

    context 'with unvalid content type' do
      let(:file) { fixture_file_upload('imagem.jpg') }

      it 'return MalformedCSVError' do
        expect{ service.run }.to raise_error(CSV::MalformedCSVError)
      end
    end

    context 'with valid tab file' do
      let(:file) { fixture_file_upload('example_input.tab') }

      it 'return expected total price value' do
        service.run
        expect(service.total_price).to eq 95.0
      end

      it 'create 4 sales' do 
        expect { service.run }.to change { Sale.count }.by(4)
      end
    end

    context 'with file fullfilled wrong' do
      let(:file) { fixture_file_upload('mal_formated_file.tab') }

      it 'dont create sale' do
        expect { service.run }.to_not change(Sale, :count)
      end
    end
  end
end 