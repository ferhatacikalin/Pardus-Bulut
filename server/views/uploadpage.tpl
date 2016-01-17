<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Bulut">

    <title>Dosya Yükle</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">


<link rel="stylesheet" href="/css/pure.css">







  
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
            <h1>Dosya Yükle</h1>
            <h2>Sunucuya Dosya Yükleyin</h2>
        </div>

        <div class="content">

        <form action="/uploadup" method="post" class="pure-form pure-form-stacked"  enctype="multipart/form-data">
        <fieldset>
  <label>Kategori: </label><select id="cat" name="cat">
           % for catitem in catlist:
            <option>{{catitem}}</option>
            % end
            </select><br>
 <label> Dosya:</label> <input type="file" name="upload" /><br>
  <input type="submit" class="pure-button pure-button-primary"value="Yükle" />
  </fieldset>
</form>
            </div>
	</div>
</div>





<script src="/css/ui.js"></script>


</body>
</html>
