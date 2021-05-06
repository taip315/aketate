require 'rails_helper'

RSpec.describe ReservationRequest, type: :model do
  before do
    @request = FactoryBot.build(:reservation_request)
  end
  describe '予約リクエスト' do
    it 'start_timeとnumber_of_peopleがあれば予約申請できる' do
      expect(@request).to be_valid
    end

    it 'start_timeが空だと予約申請できない' do
      @request.start_time = ''
      @request.valid?
      expect(@request.errors.full_messages).to include '予約時間を入力してください'
    end

    it 'number_of_peopleが空だと予約申請できない' do
      @request.number_of_people = ''
      @request.valid?
      expect(@request.errors.full_messages).to include '人数を入力してください'
    end

    it 'number_of_peopleが数字以外だと予約申請できない' do
      @request.number_of_people = '一人'
      @request.valid?
      expect(@request.errors.full_messages).to include '人数は数値で入力してください'
    end
  end
end
