<template>
  <div class="memo-detail">
    <div class="memo-detail-header">
      <h1 class="detail-header-title">メモ</h1>
      <p class="exp-text">学習中の気付きを項目別にメモをしていく機能の説明をしていきます!</p>
    </div>
    <div class="memo-detail-body">
      <div class="memo-detail-content">
        <h3 class="detail-content-title">メモルームを作ろう</h3>
        <p class="detail-content-exp">メモを項目別に残すことができます!</p>
        <p class="detail-content-exp">まずは自分の作りたいメモルームを作成します。</p>
        <img src="/images/create_subject2.gif" alt="" class="gif-wrapper">
      </div>
      <div class="memo-detail-content">
        <h3 class="detail-content-title">メモを書こう</h3>
        <p class="detail-content-exp">先ほど作成したメモルームに入り、書きたいことをメモします。</p>
        <p class="detail-content-exp">必要に応じて画面のスクリーンショット等を入れることもできます。</p>
        <img src="/images/create_memo2.gif" alt="" class="gif-wrapper">
      </div>
      <div class="memo-detail-content">
        <h3 class="detail-content-title">書いたメモを見よう</h3>
        <p class="detail-content-exp">これまでに書いたメモをキーワード検索できます。</p>
        <p class="detail-content-exp">メモタイトルをクリックすると詳細情報を確認することができます。</p>
        <img src="/images/show_memo2.gif" alt="" class="gif-wrapper">
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'MemoDetailsPage'
}
</script>

<style scoped>
.memo-detail {
  padding-top: 70px;
  margin: 0 auto;
  width: 70vw;
  min-width: 800px;
}

.memo-detail-header {
  margin-bottom: 50px;
}

.memo-detail-content {
  margin-bottom: 50px;
}

.gif-wrapper {
  margin: 60px 0;
  width: 100%;
}

@media screen and (max-width: 1000px) {
  .memo-detail {
    padding-top: 100px;
  }
  .detail-header-title {
    font-size: 70px;
    font-weight: bold;
  }

  .detail-content-title {
    font-size: 45px;
    font-weight: bold;
  }

  .exp-text {
    font-size: 30px;
  }

  .detail-content-exp {
    font-size: 30px;
  }
}

</style>