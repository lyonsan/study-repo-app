<template>
  <div class="article-detail">
    <div class="article-detail-header">
      <h1 class="detail-header-title">記事</h1>
      <p class="exp-text">学習中に得た知識を発信する機能の説明をしていきます!</p>
    </div>
    <div class="article-detail-body">
      <div class="article-detail-content">
        <h3 class="detail-content-title">記事を作成しよう</h3>
        <p class="detail-content-exp">学習中に得た気付きを全世界に発信できます!</p>
        <p class="detail-content-exp">新たに得た学びを、みんなが理解できるような言葉で書いてみましょう。</p>
        <p class="detail-content-exp">説明することで学習効率を上げましょう!</p>
        <img src="/images/create_article2.gif" alt="" class="gif-wrapper">
      </div>
      <div class="article-detail-content">
        <h3 class="detail-content-title">記事を探そう</h3>
        <p class="detail-content-exp">ユーザーが作成した記事から、自分の知りたい内容を扱ったものを探してみましょう。</p>
        <p class="detail-content-exp">フリーワード検索以外にも、学習ジャンル検索やタグ検索ができます。</p>
        <img src="/images/search_article.gif" alt="" class="gif-wrapper">
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'ArticleDetailsPage'
}
</script>

<style scoped>
.article-detail {
  padding-top: 70px;
  margin: 0 auto;
  width: 70vw;
  min-width: 800px;
  display: flex;
  flex-direction: column;
}

.article-detail-header {
  margin-bottom: 50px;
}

.article-detail-content {
  margin-bottom: 50px;
}

.gif-wrapper {
  margin: 60px 0;
  width: 100%;
}

@media screen and (max-width: 1000px) {
  .article-detail {
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