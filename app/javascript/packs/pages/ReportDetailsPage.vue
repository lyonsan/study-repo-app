<template>
  <div class="repo-detail">
    <div class="repo-detail-header">
      <h1 class="detail-header-title">学習報告</h1>
      <p class="exp-text">仲間と学習報告を行う機能の説明をしていきます!</p>
    </div>
    <div class="repo-detail-body">
      <div class="repo-detail-content">
        <h3 class="detail-content-title">学習報告ルームを作ろう</h3>
        <p class="detail-content-exp">まずは学習報告を行うための報告ルームを作成しましょう。</p>
        <p class="detail-content-exp">必要な事項を入力し、学習報告を行いたい仲間を選んだらルーム作成をクリック!</p>
        <p class="detail-content-exp">(一人でルームを作成し、自分の学習振り返りに使っていただくことも可能です)</p>
        <img src="/images/create_room.gif" alt="" class="gif-wrapper">
      </div>
      <div>
        <h3 class="detail-content-title">学習報告を行おう</h3>
        <p class="detail-content-exp">ルームを作成したら、ルーム内で学習報告を実施しましょう!</p>
        <p class="detail-content-exp">その日の学習時間や学習内容を振り返り、明日の計画を立てましょう。</p>
        <p class="detail-content-exp">記録が残り、後から毎日の学習内容を確認できます。</p>
        <img src="/images/create_report.gif" alt="" class="gif-wrapper">
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'ReportDetailsPage'
}
</script>

<style scoped>
.repo-detail {
  padding-top: 70px;
  margin: 0 auto;
  width: 70vw;
  min-width: 800px;
}

.repo-detail-header {
  margin-bottom: 50px;
}

.repo-detail-content {
  margin-bottom: 50px;
}

.gif-wrapper {
  margin: 60px 0;
  width: 100%;
}

@media screen and (max-width: 1000px) {
  .repo-detail {
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