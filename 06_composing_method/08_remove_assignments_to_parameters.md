 [理由]  
 まず、「引数への代入」という言葉の意味をはっきりさせておこう。  
 メソッドへの引数として foo という名前のオブジェクトを渡したとき、引数への代入とは、別のオブジェクトを指すように foo を書き換えることである。  
 渡されたオブジェクトに操作を加えることには何の問題もなく、私もよくやっている。  
 私がよくないと思っているのは、foo がまったく別のオブジェクトを参照するようにすることである。  
 
 def a_method(foo)
   foo.modify_in_some_way # 問題なし
   foo = another_object # 問題が起きる
 end
 
 私がこれをよくないと思う理由は、結局のところ、値渡しか参照渡しかで混乱が起きるということと、わかりにくいということである。  
 Rubyは値渡しだけを使っているので(後述を参照)、ここでの議論はそれを前提に進める。  
 値渡しでは、引数に変更を加えても、呼び出し元ルーチンには影響が及ばない。  
 参照渡しを使ったことのあるプログラマからは、この部分はおそらく紛らわしく感じられるだろう。  
 
 コード本体の中にも紛らわしさがある。渡されたものを表すという引数の機能はどこに行っても変わらないので、  
 引数の用途をそれだけに絞れば、コードはずっとわかりやすくなる。  
 Rubyでは、引数に値を代入してはならない。そして、引数への代入を見かけたら、「引数への代入の除去」を適用すべきである。  
 もちろん、このルールは、出力引数をサポートする他の言語にはかならずしも当てはまらないが、  
 そういった言語でも、私はなるべく出力引数を避けるようにしている。  

 [手順]  
 1. 引数のための一時変数を作る。  
 2. 代入後の引数に対するすべての参照を一時変数への参照に取り換える。  
 3. 引数への代入を一時変数への代入に書き換える。  
 4. テストする。  