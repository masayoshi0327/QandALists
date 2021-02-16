# 勉強サポートアプリ「わかりすと」

## 1.概要

「わからないことリスト」と「わかったことリスト」の2画面（新規作成、編集画面除く）で構成。わからないことをリストアップし、解決方法を見出してメモをつけるとリストから消え、わかったことリストに保存される。ToDoリストとメモを合わせたようなアプリ。

## 2.利用方法

1. わからないことリストに自分の疑問、課題をひとつずつリストアップする。  
<img src="QandALists/Assets.xcassets/HowToUse2-1.imageset/HowToUse2-1.png" width=25%>
<img src="QandALists/Assets.xcassets/HowToUse2-2.imageset/HowToUse2-2.png" width=25%>
<img src="QandALists/Assets.xcassets/HowToUse3-1.imageset/HowToUse3-1.png" width=25%>

1. 解決した項目を選び、タップするとメモできる画面に遷移する。  
<img src="QandALists/Assets.xcassets/HowToUse3-2.imageset/HowToUse3-2.png" width=25%>

1. メモや参考にした記事のURLを書き、「解決！」ボタンを押す。

1. わからないことリストから選んだ項目が消え、わかったことリストに保存されている。  
<img src="QandALists/Assets.xcassets/HowToUse4-1.imageset/HowToUse4-1.png" width=25%>

## 3.目指した課題解決

勉強や課題、プロジェクトに取り組む際、わからないことが多すぎてどこから手をつけていいか困ることがあり、それらを整理できる理想的なアプリがほしかった。
また、一度調べたことをしばらく経ってからまた調べるような無駄を省きたいという気持ちから、解決したことをストックするような機能を作りたかった。

## 4.洗い出した要件

- ToDoリスト（わからないことリスト）  
勉強や課題、プロジェクトに取り組む中でわからないことをリストアップする。解決したらリストから消える。

- メモ（わかったことリスト）  
わからないことにメモをつけ、わかったこととして保存する。

## 5.DB設計

Questionテーブル（わからないこと）  

Attribute | Type
-|-
date | Date
content | String

Answerテーブル（わかったこと）  
Attribute | Type
-|-
date | Date
title | String
solution | String
url | String

関連付けはなし。AnswerのtitleはQuestionのcontentがそのまま入る仕様になっている（保存後に編集可能）。
