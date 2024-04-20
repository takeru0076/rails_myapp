require 'rails_helper'

describe Todo do
  before { @user = create(:user) } # 事前にユーザーを作成

  let(:title) { 'テストタイトル' }
  let(:completed) { false }
  let(:daily_summary_id) { create(:daily_summary, user: @user).id } # ランダムなdaily_summaryを作成し、そのIDを外部キーに設定

  describe 'バリデーションの検証' do
    let(:todo) { build(:todo, title: title, completed: completed, daily_summary_id: daily_summary_id) }

    context '正常系' do
      it '有効である' do
        expect(todo.valid?).to be(true)
      end
    end

    context '異常系' do
      context 'titleが空の場合' do
        let(:title) { nil }
        it '無効である' do
          expect(todo.valid?).to be(false)
          expect(todo.errors[:title]).to include('が入力されていません。')
        end
      end

      context 'daily_summary_idが空の場合' do
        let(:daily_summary_id) { nil }
        it '無効である' do
          expect(todo.valid?).to be(false)
          expect(todo.errors[:daily_summary]).to include('が入力されていません。')
        end
      end
    end
  end

  describe 'Todoが持つ情報の検証' do
    before { create(:todo, title: title, completed: completed, daily_summary_id: daily_summary_id) } # Todo を作成

    subject { described_class.first }

    it 'Todoの属性値を返す' do
      expect(subject.title).to eq('テストタイトル')
      expect(subject.completed).to eq(false)
      expect(subject.daily_summary_id).to eq(daily_summary_id)
    end
  end
end
