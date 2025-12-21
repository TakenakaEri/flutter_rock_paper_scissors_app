# flutter_rock_paper_scissors_app

Flutter 大学のテキストを使用して学習したじゃんけんアプリ。

## 学習できた内容

#### Sccafold

骨組みや土台という意味。画面の基本構造。

#### AppBar

アプリ上部に表示されるバー（フッター）

#### body

画面のメインコンテンツの部分。

#### build 関数

Widget の見た目を作る関数。再実行することで画面が変わる。

#### onPress

ボタンが押された時に実行される関数を指定するプロパティ。

#### setState()

statefulWidget で setState()を呼び出すと build が再実行されて画面が動的に変わる。

#### mainAxisAlignment

子要素の並びを指定する。

#### const と final

const：コンパイル時に値が決まっている必要がある。
final：実行時に値が決定する。再代入不可。

#### Widget の役割

| Widget      | 役割                                       |
| ----------- | ------------------------------------------ |
| `Scaffold`  | 画面の基本構造（AppBar、body、ボタンなど） |
| `Column`    | 縦に並べる                                 |
| `Row`       | 横に並べる                                 |
| `Container` | 箱（余白、色、サイズ指定）                 |
| `Text`      | 文字表示                                   |
| `SizedBox`  | 余白・間隔                                 |

#### null チェック

dart はデフォルトでは null を許容しないので、null 許容してあげる必要がある。

```
 // 変数での許容
 String? name =null;
 Hand? myHand=null;

//nullの場合の代替えを指定
Text(myHand?.text ?? '?')

```

#### null 対応アクセス演算子

`?.`と記載することで、値がある場合はその値を、null だった場合は null を返す。

```
Hand?.text //Hand.textが存在する場合はその値を返す。ない場合はnull
```

#### null 合体演算子

左側が null なら??の右側を返す。null でなければ左側を使う

```
(何か) ?? '?'

myHand?.text ?? '?' //myHandがnullなら?を返す。nullでなければ、myHand.textを返す
```
