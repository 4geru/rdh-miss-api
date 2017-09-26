# A3RT Proofreading API使ってみた.
[A3RT](http://a3rt.recruit-tech.co.jp/proofreading)とはリクルートホールディング社が提供する人工知能APIである。

## git clone
作業用リポジトリにcloneする。

```
 $ git clone https://github.com/4geru/rdh-miss-api.git
```

## API KEY等
### TOKEN発行
1. [A3RT Proofreading API ](http://a3rt.recruit-tech.co.jp/product/proofreadingAPI/)  
API KEY発行を押して、承認・自分のメールアドレスを打ち込み、メール認証をする。

<img src="https://raw.githubusercontent.com/4geru/rdh-miss-api/master/doc/image/proofreading_00.png" width="400px">

2. Twitter API

[management](https://apps.twitter.com/)、アプリを作っていない場合、ここから発行する。

sigin inしてアプリを作成する。(携帯での電話認証が必要

<img src="https://raw.githubusercontent.com/4geru/rdh-miss-api/master/doc/image/twitter01.png" width="400px">

入力するWebsiteはgithubでもいける。

<img src="https://raw.githubusercontent.com/4geru/rdh-miss-api/master/doc/image/twitter_00.png" width="400px">

Key and Access Tokensにて、Consumer Key (API Key)/Consumer Secret (API Secret)/Access Token/Access Token Secret を作成する。

### 環境変数を作る
.envファイルを作成し、APIKEYを書き込む。

```env:.env
CONSUMER_KEY="_Twitter_"
CONSUMER_SECRET="_Twitter_"
OAUTH_TOKEN="_Twitter_"
OAUTH_TOKEN_SECRET="_Twitter_"
TYPO_API="_A3RT_Proofreading_API_TOKEN_"
```
## rubyで実行
bundlerで必要なものをDownloadし、実行する.

```
 $ bundle 
 $ bundle exec ruby stream.rb
```