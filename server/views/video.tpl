%import urllib
%print "Video Oynatılıyor"
<!doctype html>
<html lang="tr">
<head>
    <meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Bulut">

    <title>Video Dosyası</title>

    


<link rel="stylesheet" href="/css/pure.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">





  
    <!--[if lte IE 8]>
        <link rel="stylesheet" href="/css/layouts/side-menu-old-ie.css">
    <![endif]-->
    <!--[if gt IE 8]><!-->
        <link rel="stylesheet" href="/css/layouts/side-menu.css">
    <!--<![endif]-->
  


    

    

</head>
<body bgcolor="EBD246">






<div id="layout">
% include('menu.tpl',catlist=catlist)

    <!-- Menu toggle -->
    <a href="#menu" id="menuLink" class="menu-link">
        <!-- Hamburger icon -->
        <span></span>
    </a>

    
    <div id="main">
        <div class="header">
            <h1>Video Dosyası: {{video}}</h1>
            
        </div>

        <div class="content" >
        <style type="text/css">
        video {
            margin-top:10%; 
            width: 100%;
            height: 90%;
    
}
        </style>
        
        <video controls  preload  loop preload autoplay  >
        <source src=" /downloads/{{urllib.quote(catvideo)}}/{{urllib.quote(video)}} " >
       
        Tarayıcınız bu ses dosyasını oynatamıyor.
        </video>
            </div>
	</div>
</div>





<script src="/css/ui.js"></script>


</body>
</html>