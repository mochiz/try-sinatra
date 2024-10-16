# Try Sinatra

## これは何？

フィヨルドブートキャンプのプラクティス「Sinatra を使って Web アプリケーションの基本を理解する」のためのリポジトリです。
sinatora で構築されたシンプルなメモアプリを提供します。

## セットアップ手順

```sh
$ git clone https://github.com/mochiz/try-sinatra.git
$ cd try-sinatra
$ bundle
```

メモを保存するための json ファイルを準備する

```sh
$ cp data/memos_seed.json data/memos.json
```

アプリを起動する

```sh
$ bundle exec ruby app.rb
```

http://localhost:4567/ でメモアプリを表示できること
