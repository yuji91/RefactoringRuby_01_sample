私がリファクタリングをするとき、作業のかなり部分は、コードを適切なパッケージに収めるメソッドの構成方法に費やされる。  

ほとんどすべての問題は、長すぎるメソッドが原因だ。  
長いメソッドが問題を起こしがちなのは、無用に複雑なロジックに埋め込まれた形で大量の情報を抱え込んでいるからである。  

リファクタリングの中心は、何となく塊になっているコードを取り出して独自のメソッドに変身させる「メソッドの抽出」(Extract Method)だ。  
「メソッドのインライン化」(Inline Method)はその逆で、独立したメソッド呼び出しを他のメソッドの一部に混ぜてしまう。 
 
「メソッドのインライン化」が必要なのは、メソッド抽出を繰り返してみたものの、その中にメソッドとしての役割を果たしていないものがある場合や、  
メソッドを分解してきた過程を思い出さなければならなくなった場合などである。  

「メソッドの抽出」で最大の問題はローカル変数をどのように扱うかで、原因のかなりの部分を作っているのは一時変数だ。  
私は、メソッドを操作するときに、「一時変数から問い合わせメソッドへ」(Replace Temp with Query)を使って取り除ける一時変数を取り除けるようにしている。  
一時変数がさまざまな目的で使われている場合は、「一時変数の分割」を先に実行して、一時変数を置き換えやすくする。  

しかし、一時変数が複雑に絡み合っていて簡単に置き換えられない場合もある。  
そのようなときは「メソッドからメソッドオブジェクトへ」(Replace Method with Method Object)が役に立つ。  
これを使うと、新しいクラスを導入するというコストを払うものの、絡み合ったオブジェクトを分割することができる。  

引数に対する代入を行わなければ、引数は一時変数よりも害がない。  
引数への代入がある場合には、「引数への代入の除去」(Remove Assignments to Parameters)をする必要がある。  

メソッドを分解すると、その仕組みがずっとわかりやすくなる。  
アルゴリズムを改良すると、さらにメソッドが明快になる場合がある。  
そのようなときは、「アルゴリズム変更」(Substitute Algorithm)を行う。

コードの意味を通りやすくするために、私は「名前付き引数の導入」(Introduce Named Parameter)を使っている。  
その後、名前付き引数によって明快になったという利益よりも、レシーバが複雑になったことによる弊害の方が大きいと判断した場合は、「名前付き引数の除去」(Remove Named Parameter)を行う。  

デフォルト引数が使われなくなったら、「使われていないデフォルト引数の除去」(Remove Unused Default Parameter)を行う必要がある。  