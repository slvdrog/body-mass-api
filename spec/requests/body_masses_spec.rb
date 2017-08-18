require 'rails_helper'

RSpec.describe 'BodyMasses API', type: :request do

  describe 'POST /body_masses' do
    let(:valid_attributes) { { height: '180', weight: '100' } }

    context 'when the request is valid' do
      before { post '/body_masses', params: valid_attributes }

      it 'returns the bmi' do
        expect(json['bmi']).to eq('25')
      end

      it 'returns the category' do
        expect(json['category']).to eq('Overweight')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/body_masses', params: { name: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Created by can't be blank/)
      end
    end
  end
end