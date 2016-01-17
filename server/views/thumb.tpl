%import urllib
<!doctype html>
<html lang="tr">
<head>
    <meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Bulut">

    <title>Resim Görüntüleyici</title>

    


<link rel="stylesheet" href="/css/pure.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">





  
    <!--[if lte IE 8]>
        <link rel="stylesheet" href="/css/layouts/side-menu-old-ie.css">
    <![endif]-->
    <!--[if gt IE 8]><!-->
        <link rel="stylesheet" href="/css/layouts/side-menu.css">
    <!--<![endif]-->
  


    

    

</head>
<body>






<div id="layout">
% include('menu.tpl',catlist=catlist)

    <!-- Menu toggle -->
    <a href="#menu" id="menuLink" class="menu-link">
        <!-- Hamburger icon -->
        <span></span>
    </a>

    
    <div id="main">
        <div class="header">
            <h1>Resim ismi: {{fileresim}}</h1>
            
        </div>

        <div class="content">
        <div class="pure-g">
        <div class="pure-u-5-5">
            <img class="pure-img"  style="width:100%;heigth:100%;" src="/downloads/{{urllib.quote(catresim)}}/{{urllib.quote(fileresim)}}">
        </div>
        </div>
            </div>
	</div>
</div>





<script src="/css/ui.js"></script>


</body>
</html>
