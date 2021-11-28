require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { user.valid? }

    let(:user) {User.new(name: "ほげ", email: "hoge@hoge", password: "hogehoge", password_confirmation: "hogehoge",is_valid: true)}
    #let!(:other_user) { create(:user) }

    context 'nameカラム' do
      it '空欄でないこと' do
        user.name = ''
        is_expected.to eq false
        # expect(user.valid?).to eq false
      end
    end

  end
end