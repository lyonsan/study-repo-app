require 'rails_helper'

RSpec.describe '学習報告投稿機能', type: :system do
  before do
    @room_user = FactoryBot.create(:room_user)
    @report = FactoryBot.build(:report)
    @user1 = FactoryBot.create(:user)
  end
  context '投稿ができる時' do
    it 'ログインしたユーザーは自分の所属するルームで学習報告を投稿できる' do
      # サインインする
      sign_in(@room_user.user)
      # 生成されたルームが存在することを確認する
      expect(page).to have_content(@room_user.room.title)
      # ルーム詳細ページに遷移
      visit room_path(@room_user.room)
      # 「学習報告ルームへ」のリンクがあることを確認
      expect(page).to have_content('学習報告ルームへ')
      # 学習報告一覧ルームに遷移する
      visit room_reports_path(@room_user.room)
      # 「学習報告を行う」のリンクがあることを確認
      expect(page).to have_content('学習報告を行う')
      # 学習報告ページに遷移する
      visit new_room_report_path(@room_user.room)
      # 報告情報を報告する
      fill_in '本日の学習時間を入力してください', with: @report.study_time
      fill_in '集中して学習を行えた時間を入力してください', with: @report.concentrated_time
      fill_in '本日用いた学習方略のうち、特によかったものとその理由を入力してください', with: @report.good_way
      find('label[for=report_achieved_true]')
      fill_in '明日何をどれくらい学習するか計画を立てましょう', with: @report.tomorrow_plan
      fill_in '本日学習した内容や知識を端的にまとめてください', with: @report.study_content
      fill_in 'メンバーに向けて、オススメの学習方略や新たに得た知識を共有しましょう', with: @report.advice
      # 送信するとReportモデルのカウントが1上がる
      expect do
        find('input[name="commit"]').click
      end.to change { Report.count }.by(1)
      # 投稿完了ページに遷移することを確認する
      expect(current_path).to eq room_reports_path(@room_user.room)
      # 「学習報告が完了しました!」と表示されている
      expect(page).to have_content('学習報告が完了しました!')
      # 学習報告ルームへのリンクがあることを確認する
      expect(page).to have_content('学習報告ルームへ')
      # 学習報告一覧ルームに遷移する
      visit room_reports_path(@room_user.room)
      # 学習報告一覧には先ほど投稿した学習報告があることを確認する
      expect(page).to have_content(I18n.l(@report.study_time, format: :length))
      expect(page).to have_content(I18n.l(@report.concentrated_time, format: :length))
      expect(page).to have_content('はい')
      expect(page).to have_content(@report.tomorrow_plan)
      expect(page).to have_content(@report.study_content)
      expect(page).to have_content(@report.advice)
    end
  end

  context '投稿ができない時' do
    it '誤った情報では投稿できない' do
      # サインインする
      sign_in(@room_user.user)
      # 生成されたルームが存在することを確認する
      expect(page).to have_content(@room_user.room.title)
      # ルーム詳細ページに遷移
      visit room_path(@room_user.room)
      # 「学習報告ルームへ」のリンクがあることを確認
      expect(page).to have_content('学習報告ルームへ')
      # 学習報告一覧ルームに遷移する
      visit room_reports_path(@room_user.room)
      # 「学習報告を行う」のリンクがあることを確認
      expect(page).to have_content('学習報告を行う')
      # 学習報告ページに遷移する
      visit new_room_report_path(@room_user.room)
      # 報告情報を報告する
      fill_in '本日の学習時間を入力してください', with: nil
      fill_in '集中して学習を行えた時間を入力してください', with: nil
      fill_in '本日用いた学習方略のうち、特によかったものとその理由を入力してください', with: nil
      fill_in '明日何をどれくらい学習するか計画を立てましょう', with: nil
      fill_in '本日学習した内容や知識を端的にまとめてください', with: nil
      fill_in 'メンバーに向けて、オススメの学習方略や新たに得た知識を共有しましょう', with: nil
      # 送信ボタンを押してもReportモデルのカウントが変わらない
      expect do
        find('input[name="commit"]').click
      end.to change { Report.count }.by(0)
      # 新規報告投稿ページに戻される
      expect(current_path).to eq "/rooms/#{@room_user.room_id}/reports"
    end
    it 'ルーム外のユーザーは投稿できない' do
      # サインインする
      sign_in(@user1)
      # ルーム詳細ページが表示されていない
      expect(page).to have_no_content(@room_user.room.title)
    end
    it 'ログインしていないと投稿できない' do
      # ルーム詳細ページに遷移
      visit room_path(@room_user.room)
      # 「学習報告ルームへ」のリンクがないことを確認
      expect(page).to have_no_content('学習報告ルームへ')
    end
  end
end

RSpec.describe '学習報告の削除機能', type: :system do
  before do
    @room_user = FactoryBot.create(:room_user)
    @report = FactoryBot.build(:report)
  end
  context '学習ルーム削除がうまくいき、そのルームで行われていた学習報告も削除される時' do
    it '学習ルームに所属するメンバーは学習ルームを削除することができ、その場合同時に学習報告も削除される' do
      # サインインする
      sign_in(@room_user.user)
      # ルームの中で学習報告を行う
      report_create(@room_user.room, @report)
      # 学習報告ルームへのリンクがあることを確認する
      expect(page).to have_content('トップページに戻る')
      # トップページに遷移する
      visit root_path
      # ルーム詳細ページに遷移
      visit room_path(@room_user.room)
      # 「削除」ボタンがあることを確認
      expect(page).to have_content('削除')
      # 「削除」ボタンをクリックすると、Reportモデルのカウントが減少する
      expect do
        click_link '削除'
      end.to change { Report.count }.by(-1)
      # 削除完了ページに遷移していることを確認する
      expect(current_path).to eq "/rooms/#{@room_user.room_id}"
    end
  end
end
