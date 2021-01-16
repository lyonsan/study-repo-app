module ReportCreateSupport
  def report_create(room, report)
    expect(page).to have_content(room.title)
    visit room_path(room)
    expect(page).to have_content("学習報告ルームへ")
    visit room_reports_path(room)
    expect(page).to have_content("学習報告を行う")
    visit new_room_report_path(room)
    fill_in '本日の学習時間を入力してください', with: report.study_time
    fill_in '集中して学習を行えた時間を入力してください', with: report.concentrated_time
    fill_in '本日用いた学習方略のうち、特によかったものとその理由を入力してください', with: report.good_way
    find('label[for=report_achieved_true]')
    fill_in '明日何をどれくらい学習するか計画を立てましょう', with: report.tomorrow_plan
    fill_in '本日学習した内容や知識を端的にまとめてください', with: report.study_content
    fill_in 'メンバーに向けて、オススメの学習方略や新たに得た知識を共有しましょう', with: report.advice
    expect do
      find('input[name="commit"]').click
    end.to change { Report.count }.by(1)
    expect(current_path).to eq room_reports_path(room)
    expect(page).to have_content("学習報告が完了しました!")
    
  end
end