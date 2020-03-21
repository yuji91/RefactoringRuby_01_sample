 [理由]  
 「一時変数のインライン化」は、たいていの場合、「一時変数から問い合わせメソッドへ」  
 (Replace Temp with Query)の一部として使われるので、これを行う本体の理由は、そちらにある。  
 「一時変数のインライン化」独自の理由として考えられるものは、メソッド呼び出しの戻り値が代入されている一時変数を見つけたときだけである。  
 この種の一時変数は、特に害を引き起こしておらず、そのまま残しておいても安全である。  
 しかし、この一時変数が「メソッドの抽出」(Extract Method)などの他のリファクタリングの邪魔になるようなら、そのときにインライン化すればよい。  

 [手順]  
 1. 一時変数を参照しているすべての箇所を検索し、参照を消して代入文の右辺に置き換える。   
 2. 変更を行うたびにテストを行う  
 3. 一時変数の宣言と代入文を取り除く。  
 4. テストする。  