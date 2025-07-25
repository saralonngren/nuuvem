require 'rails_helper'

RSpec.describe "Sales", type: :request do
  
  describe 'POST #import_file' do
    subject :post_import_file do
      post '/sales/import_file', params: params
    end  

    subject :post_create_sale do
      post '/sales'
    end

    before do 
      post_import_file
    end

    context 'with wrong file type' do
      let(:wrong_file) { fixture_file_upload('imagem.jpg') }
      let(:params) { { file: wrong_file } }

      it 'return expected message' do
        expect(flash[:notice]).to match(/There are some error in your file. Please verify the file and try again./)
      end

      it 'redirect to expected page' do
        expect(response).to redirect_to('/sales')
      end
    end

    context 'with no file' do
      let(:params) {{}}

      it 'return expected message' do
        expect(flash[:notice]).to match(/File not found. Please verify the file and try again./)
      end

      it 'redirect to expected page' do
        expect(response).to redirect_to('/sales')
      end
    end

    context 'with correct file type' do 
      let(:correct_file) { fixture_file_upload('example_input.tab') }
      let(:params) { { file: correct_file } }

      it 'return expected message' do
        expect(flash[:notice]).to match(/Sales uploaded successfully 🥳 Your total gross income is 95.0/)
      end

      it 'redirect to expected page' do
        expect(response).to redirect_to('/sales')
      end
    end

    context 'file fullfilled wrong' do 
      let(:mal_formated_file) { fixture_file_upload('mal_formated_file.tab') }
      let(:params) { { file: mal_formated_file } }

      it 'return expected message' do
        expect(flash[:notice]).to match(/Your total gross income is 0. You may have added some wrong value to your columns or the calculation its really 0. 🤔/)
      end

      it 'redirect to expected page' do
        expect(response).to redirect_to('/sales')
      end
    end
  end
end
