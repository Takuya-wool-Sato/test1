## pythonでGoogleの画像をスクレイピングする

最近、自分の作業として、マークアップがメインとなっていますが、画像を挿入する際、まだクライアントから

データが来ないことがあり、仮で探した画像を入れることがあります。

その時、画像を適当に探して、ダウンロードしてくれる簡単なアプリがあればと思い、pythonのスクレイピングを作成しました。

スクレイピング(Scraping)とは、Webサイトから任意の情報を検索し抽出する技術のことです。

また、Web上のデータの取得だけではなく、構造も解析できます。

具体的動作として

１、画像をキーワードで検索（検索の数も指定する）

２、フォルダに検索数に応じて保存

です。

今回は誰でも活用できるよう、環境構築から書きます。

## 環境構築

具体的な方法↓から行けますので、参考にしてください。ここでは省きます。

https://prog-8.com/docs/python-env

## venv による仮想環境構築

プロジェクトによって使うライブラリが違う際は、仮想環境構築をした方良いです。

プロジェクト作成

```
mkdir project
cd project
```
venvによる仮想環境切り出し
```
python3 -m venv env
```
仮想環境を有効にする
```
source env/bin/activate
```
仮想環境から出る
```
deactivate
```

## モジュールicrawlerをインストールする

icrawlerとは↓

icrawlerとはウェブクローラのミニフレームワークです。

icrawler はGoogle、Bing、Baidu、Flickrなどの画像検索サービスから画像をダウンロードしてくれる便利なPythonのパッケージです。

だそうです。

```
pip install icrawler
```

## 具体的なコードと実行

pythonと言うフォルダ作成後、仮想環境作成後

scraping.pyと言うファイルを作成、下記のコードを入力

```
from icrawler.builtin import BingImageCrawler

keyword_input=input('検索したいキーワードを入力してください：\n')

number_input = input('検索数を入力してください：\n')

number_int = int(number_input)

if number_input.isdecimal():
  crawler = BingImageCrawler(storage={"root_dir": keyword_input})

  crawler.crawl(keyword=keyword_input, max_num=number_int)
else:
  print("エラーです。")
```
実行
```
python scraping.py
```

![スクリーンショット 2020-10-07 18 59 47](https://user-images.githubusercontent.com/59082843/95316930-6de66400-08cf-11eb-9305-d9e51463767e.png)

![スクリーンショット 2020-10-07 19 00 09](https://user-images.githubusercontent.com/59082843/95316942-7179eb00-08cf-11eb-8073-2bec7ea47c4e.png)

## 注意点

webスクレイピングには,規約違反があるので気をつけた方が良いそうです↓

https://qiita.com/neet-AI/items/98d4194872ee4f53e3b4

## 参考サイト

環境構築
https://prog-8.com/docs/python-env

MacにPython3をインストールし環境構築【決定版】
https://qiita.com/7110/items/1aa5968022373e99ae28

Pythonで画像データを手軽に収集したい方必読！　icrawler入門
https://aiacademy.jp/media/?p=352


