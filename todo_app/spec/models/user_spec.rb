require 'rails_helper'

describe User do
  let(:nickname) { 'テスト太郎' }
  let(:email) { 'test@example.com' }
  let(:user) { User.new(nickname: nickname, email: email, password: password, password_confirmation: password) } # 変数に格納

  describe '.first' do
    before do
      create(:user, nickname: nickname, email: email)
    end

    subject { described_class.first }

    it '事前に作成した通りのUserを返す' do
      expect(subject.nickname).to eq('テスト太郎')
      expect(subject.email).to eq('test@example.com')
    end
  end

  describe 'validation' do
    let(:password) { '12345678' }

    describe 'nickname属性' do
      describe '文字数制限の検証' do
        context 'nicknameが20文字以下の場合' do
          let(:nickname) { 'あいうえおかきくけこさしすせそたちつてと' } # 20文字

          it 'User オブジェクトは有効である' do
            expect(user.valid?).to be(true)
          end
        end

        context 'nicknameが20文字を超える場合' do
          let(:nickname) { 'あいうえおかきくけこさしすせそたちつてとな' } # 21文字

          it 'User オブジェクトは無効である' do
            user.valid?

            expect(user.valid?).to be(false)
            expect(user.errors[:nickname]).to include('は20文字以下に設定して下さい。')
          end
        end
      end

      describe '存在性の検証' do
        context 'nicknameが空欄の場合' do
          let(:nickname) { '' }

          it 'User オブジェクトは無効である' do
            expect(user.valid?).to be(false)
            expect(user.errors[:nickname]).to include("が入力されていません。")
          end
        end
      end
    end
  end

  describe '紐づくDailySummaryの情報を取得' do
    before do
      @user = create(:user)
      @daily_summary = create(:daily_summary, user_id: @user.id, date: Date.today, todos_completed_count: 5)
    end

    subject { described_class.first }

    it '紐づくDailySummaryの情報を取得できる' do
      expect(subject.daily_summaries.size).to eq(1)
      expect(subject.daily_summaries.first.date).to eq(Date.today)
      expect(subject.daily_summaries.first.todos_completed_count).to eq(5)
      expect(subject.daily_summaries.first.user_id).to eq(@user.id)
    end
  end
end
