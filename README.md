DESCRIPTION
===========
hatena blogでプレゼンテーションを貼りたいというslideshareに上げるのすら面倒な人間によるプロジェクトです

REQUIREMENT
===========
hatena blog
「そのまま編集モード」でしか使えません

INSTALL
===========

## JavaScript
デザイン→フッターに下記4つのJavaScriptを貼ってください
```
<script type="text/javascript" charset="utf8" src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://raw.github.com/gist/4079385/0b4ea58fdb3898737cf1be2c06ce6d7532e87878/d3.v2.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://raw.github.com/gist/4079385/dc24e848b47cc38483a3d1107adf04bce82d73f2/highlight.v0.js"></script>
<script type="text/javascript" charset="utf8" src="https://raw.github.com/gist/4079385/83181d6abfacfb9c2959c6b0da5712f9c712a7a9/hatenapresentation.js"></script>
```

## Style
[リンク](https://gist.github.com/raw/4079385/b49be634fb74ade19885992697964ab5ad079444/hatenapresentation.css)の中身を「デザインCSS」にペーストしてください

※ link貼ったらうまくCSS当たりませんでした。誰か教えてください

USAGE
=========
<code>div.presentation</code>でくくられた中身がプレゼンテーションになります。
<code>div.slide</code>の中身が1ページになります
```
<div class="presentation">
  <div class="slide">
    <h2>タイトル</h2>
    <p>中身</p>
  </div>
  <div class="slide">
    <h2>タイトル</h2>
    <pre><code class="javascript">function(){
  var hoge = "fuga";
}</code></pre>
  </div>
  <div class="slide">
    <h1 class="red">タイトル</h1>
  </div>
</div>
```

LICENSE
=========
Copyright 2012- Muddy Dixon (muddydixon)

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at


THANKS
=========
Ivan Sagalaev [highlight](http://softwaremaniacs.org/soft/highlight/en/)
Mike Bostock [d3.js](http://d3js.org/)

