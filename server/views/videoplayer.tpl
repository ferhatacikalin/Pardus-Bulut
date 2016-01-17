%import urllib
%import os
%import mimetypes
%print "Video Oynatıcı Açıldı"
<!doctype html>
<html lang="tr">
<head>
    <meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Bulut">

    <title>Video Oynatıcı</title>

    


<link rel="stylesheet" href="/css/pure.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">




<script type='text/javascript' src='http://code.jquery.com/jquery-1.7.js'></script>
  
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
            <h1>Video Oynatıcı</h1>
            
        </div>
 <style type='text/css'>
    #playlist {
    display:table;
}
#playlist li{
    color: white;
    cursor:pointer;
    padding:8px;
}

#playlist li:hover{
    color:white;                        
}
#videoarea {
    
    
    width:100%;
    
    margin:10px;    
    
}
  </style>
  
<script type='text/javascript'>//<![CDATA[
$(window).load(function(){
$(function() {
    $("#playlist li").on("click", function() {
        $("#videoarea").attr({
            "src": $(this).attr("movieurl"),
            "poster": "",
            "autoplay": "autoplay"
        })
    })
    $("#videoarea").attr({
        "src": $("#playlist li").eq(0).attr("movieurl"),
        "poster": $("#playlist li").eq(0).attr("moviesposter")
    })
})
});//]]> 

</script>
        <div class="content" >
        <div class="pure-g">
  

    <div class="pure-u-5-5">
        <video id="videoarea" controls="controls" poster="" src=""></video>
<br>
<ul id="playlist" style="background:#666;width:100%;">
%for  cates in os.listdir(os.getcwd()+"/"+"files"):
 
%for file in os.listdir(os.getcwd()+"/"+"files"+"/"+cates):
<% mimetf=mimetypes.guess_type("files/"+cates+"/"+file)%>
  <% mimet=mimetf[0] %>
<%if mimet =='video/ogg' or mimet == 'video/mp4' or mimet=='video/webm' or mimet=='video/aac' or mimet=='video/mpeg':%>
    <li movieurl="/downloads/{{cates}}/{{file}}">{{file}}</li>
 %end
 %end
 %end  
</ul>
</div>
</div>
        
            </div>
    </div>
</div>





<script src="/css/ui.js"></script>


</body>
</html>