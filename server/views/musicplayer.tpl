%import urllib
%import os
%import mimetypes
%print "Müzik Oynatıcı Açıldı"
<!doctype html>
<html lang="tr">
<head>
    <meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Bulut">

    <title>Müzik Oynatıcı</title>

    


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
            <h1>Müzik Oynatıcı</h1>
            
        </div>
<style type="text/css" >
    #playlist,audio{background:#666;width:100%;padding:20px;}
.active a{color:#5DB0E6;text-decoration:none;}
li a{color:#eeeedd;padding:5px;display:block;}
li a:hover{text-decoration:none;}

</style>
<script type='text/javascript'>//<![CDATA[
$(window).load(function(){
var audio;
var playlist;
var tracks;
var current;

init();
function init(){
    current = 0;
    audio = $('audio');
    playlist = $('#playlist');
    tracks = playlist.find('li a');
    len = tracks.length - 1;
    audio[0].volume = .10;
    audio[0].play();
    playlist.find('a').click(function(e){
        e.preventDefault();
        link = $(this);
        current = link.parent().index();
        run(link, audio[0]);
    });
    audio[0].addEventListener('ended',function(e){
        current++;
        if(current == len){
            current = 0;
            link = playlist.find('a')[0];
        }else{
            link = playlist.find('a')[current];    
        }
        run($(link),audio[0]);
    });
}
function run(link, player){
        player.src = link.attr('href');
        par = link.parent();
        par.addClass('active').siblings().removeClass('active');
        audio[0].load();
        audio[0].play();
}
});//]]> 

</script>
        <div class="content" >
        
        
        <div class="pure-g">
  

    <div class="pure-u-5-5">
    <img class="pure-img" src="/css/mp3.png" style="width:30%;margin-left:35%;"><p></p><audio id="audio" preload="auto" tabindex="0" controls="" type="audio/mpeg"><source type="audio/mp3" src="">
        Sorry, your browser does not support HTML5 audio.
    </audio>
    
<ul id="playlist">
%for  cates in os.listdir(os.getcwd()+"/"+"files"):
 
%for file in os.listdir(os.getcwd()+"/"+"files"+"/"+cates):
<% mimetf=mimetypes.guess_type("files/"+cates+"/"+file)%>
  <% mimet=mimetf[0] %>
<%if mimet=='audio/mp3' or mimet =='audio/ogg' or mimet == 'audio/mp4' or mimet=='audio/webm' or mimet=='audio/aac' or mimet=='audio/mpeg':%>
        <li class="active"><a  href="/downloads/{{cates}}/{{file}}">{{file}}</a></li>
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