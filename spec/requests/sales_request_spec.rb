require 'rails_helper'

RSpec.describe "Sales", type: :request do
  
  describe 'POST #import_file' do
    subject :post_import_file do
      post '/sales/import_file', params: params
    end
  
    let(:correct_file) { fixture_file_upload('example_input.tab') }
    let(:wrong_file) { fixture_file_upload('imagem.jpg') }

    before do 
      post_import_file
    end

    context 'with wrong file type' do
      let(:params) { { file: wrong_file } }

      it 'return expected message' do
        expect(flash[:notice]).to match(/Invalid file. Please verify the file and try again./)
      end

      it 'redirect to expected page' do
        expect(response).to redirect_to('/sales')
      end
    end

    context 'with no file' do
      let(:params) {{}}

      it 'return expected message' do
        expect(flash[:notice]).to match(/No file found. Please verify the file and try again./)
      end

      it 'redirect to expected page' do
        expect(response).to redirect_to('/sales')
      end
    end

    context 'with correct file type' do 
      let(:params) { { file: correct_file } }

      it 'return expected message' do
        expect(flash[:notice]).to match(/Sales uploaded successfully/)
      end

      it 'redirect to expected page' do
        expect(response).to redirect_to('/sales?total_price=95.0')
      end
    end

    context 'file fullfilled wrong' do 
    end
  end

  describe 'GET #index' do
  end
end
