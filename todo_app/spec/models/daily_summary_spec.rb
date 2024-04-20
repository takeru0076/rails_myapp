require 'rails_helper'

describe DailySummary do
  before { @user = create(:user) } # 事前にユーザーを作成

  let(:date) { Date.today }
  let(:todos_completed_count) { 5 }
  let(:user_id) { @user.id }

  describe 'バリデーションの検証' do
    let(:daily_summary) { build(:daily_summary, date: date, todos_completed_count: todos_completed_count, user_id: user_id) }

    context '正常系' do
      it '有効である' do
        expect(daily_summary.valid?).to be(true)
      end
    end

    context '異常系' do
      context 'dateが空の場合' do
        let(:date) { nil }
        it '無効である' do
          expect(daily_summary.valid?).to be(false)
          expect(daily_summary.errors[:date]).to include('が入力されていません。')
        end
      end

      context 'todos_completed_countが負の数の場合' do
        let(:todos_completed_count) { -1 }
        it '無効である' do
          expect(daily_summary.valid?).to be(false)
          expect(daily_summary.errors[:todos_completed_count]).to include('は0以上の値にしてください。')
        end
      end

      context 'user_idが空の場合' do
        let(:user_id) { nil }
        it '無効である' do
          expect(daily_summary.valid?).to be(false)
          expect(daily_summary.errors[:user]).to include('が入力されていません。')
        end
      end
    end
  end

  describe 'DailySummaryが持つ情報の検証' do
    before { create(:daily_summary, date: date, todos_completed_count: todos_completed_count, user_id: user_id) } # DailySummaryを作成

    subject { described_class.first }

    it 'DailySummaryの属性値を返す' do
      expect(subject.date).to eq(Date.today)
      expect(subject.todos_completed_count).to eq(5)
      expect(subject.user_id).to eq(@user.id)
    end
  end
end
