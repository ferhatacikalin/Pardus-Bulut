<% import os %>
<% import mimetypes %>
<% print "yeni klasör listelendi" %>

<!doctype html>
<html lang="tr">
<head>
    <meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Bulut">

    <title>Bulut</title>

    


<link rel="stylesheet" href="/css/pure.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

 <style scoped>

        .button-success,
        .button-error,
        .button-warning,
        .button-secondary {
            color: white;
            border-radius: 4px;
            text-shadow: 0 1px 1px rgba(0, 0, 0, 0.2);
        }

        .button-success {
            background: rgb(28, 184, 65); /* this is a green */
        }

        .button-error {
            background: rgb(202, 60, 60); /* this is a maroon */
        }

        .button-warning {
            background: rgb(223, 117, 20); /* this is an orange */
        }

        .button-secondary {
            background: rgb(66, 184, 221); /* this is a light blue */
        }

    </style>






  
    <!--[if lte IE 8]>
        <link rel="stylesheet" href="css/layouts/side-menu-old-ie.css">
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
            <h1>{{title}}</h1>
            
        </div>

        <div class="content">

  <table class="pure-table pure-table-horizontal"  >
    <thead>
        <tr>
            
            <th>Dosya Adı</th>
            <th>#</th>
             

            
        </tr>
    </thead>

    <tbody>


    % for it in filelist:
  <% mimetf=mimetypes.guess_type("files/"+title+"/"+it)%>
  <% mimet=mimetf[0] %>
        <tr>
            <td>{{it}} </td>
            <td>
            <button class="pure-button button-error" onclick="window.location='/deletefile/{{title}}/{{it}}'"><i class="fa fa-trash"></i>Sil</button> 

            <button class="pure-button button-success" onclick="window.location='/downloads/{{title}}/{{it}}'"><i class="fa fa-download"></i>İndir</button>
%if mimet=='image/gif' or mimet =='image/png' or mimet == 'image/jpeg':
<button class="pure-button button-warning"onclick="window.location='/thumb/{{title}}/{{it}}'"><i class="fa fa-picture-o"></i>Göster</button>
%end
<%if mimet=='audio/mp3' or mimet =='audio/ogg' or mimet == 'audio/mp4' or mimet=='audio/webm' or mimet=='audio/aac' or mimet=='audio/mpeg':%>
<button class="pure-button button-warning"onclick="window.location='/music/{{title}}/{{it}}'"><i class="fa fa-play"></i>Çal</button>
%end
<%if mimet=='video/mp4' or mimet =='video/ogg'  or mimet=='video/webm' or mimet=='video/mpeg':%>
<button class="pure-button button-warning"onclick="window.location='/video/{{title}}/{{it}}'"><i class="fa fa-play"></i>Oynat</button>
%end
</td>       
            
        </tr>

    % end
    </tbody>
</table>
            </div>
	</div>
</div>





<script src="/css/ui.js"></script>


</body>
</html>
