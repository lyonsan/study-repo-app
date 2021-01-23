module MemoCreateSupport
  def memo_create(subject, memo)
    # 「メモ」ページへのリンクがあることを確認する
    expect(page).to have_content('メモ')
    # 科目ルーム一覧ページに遷移する
    visit subjects_path
    # 生成された科目ルームが存在することを確認する
    expect(page).to have_content(subject.name)
    # メモ一覧ページに移動
    visit subject_memos_path(subject)
    # 「メモを作成する」のリンクがあることを確認
    expect(page).to have_content('メモを作成する')
    # メモ新規作成ページへ遷移
    visit new_subject_memo_path(subject)
    # 今回貼り付ける画像を定義する
    image_path = Rails.root.join('app/assets/images/rooms-index-01.jpg')
    # メモの内容を記入する
    fill_in 'メモの題名', with: memo.topic
    fill_in '関係する記述（コードや問題文等）を書きましょう', with: memo.point
    fill_in 'メモを書きましょう', with: memo.explanation
    # 作成ボタンを押すと、Memoモデルのカウントが1上がることを確認する
    expect do
      find('input[name="commit"]').click
    end.to change { Memo.count }.by(1)
    # 作成完了ページに遷移することを確認する
    expect(current_path).to eq subject_memos_path(subject)
    # 「メモを作成しました!」の文字があることを確認する
    expect(page).to have_content('メモを作成しました!')
    # メモ一覧ページに遷移する
    visit subject_memos_path(subject)
    # 先ほど作成したメモが存在することを確認する
    expect(page).to have_content(memo.topic)
  end
end
