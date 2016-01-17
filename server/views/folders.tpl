%import os
%import urllib
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Bulut">

    <title>Klasörler</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">


<link rel="stylesheet" href="/css/pure.css">







  
    <!--[if lte IE 8]>
        <link rel="stylesheet" href="/css/layouts/side-menu-old-ie.css">
    <![endif]-->
    <!--[if gt IE 8]><!-->
        <link rel="stylesheet" href="/css/layouts/side-menu.css">
    <!--<![endif]-->
  


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
            <h1>Klasörler</h1>
            <h2>Klasörleri Yönetin</h2>
        </div>

        <div class="content">
<div class="pure-u-5-5">
         <table class="pure-table pure-table-horizontal"  >
    <thead>
        <tr>
            
            <th>Klasör</th>
            <th>#</th>
             

            
        </tr>
    </thead>

    <tbody>
%for folder in os.listdir(os.getcwd()+"/files"):
<tr>
            
            <th>{{folder}}</th>
            <th><button class="pure-button button-error" onclick="window.location='/deletefolder/{{urllib.quote(folder)}}/true'"><i class="fa fa-trash"></i>Sil</button> </th>
             

            
        </tr>
%end
</tbody>
</table></div>
<form class="pure-form pure-form-stacked" method="post" action="/addfolder" >
    <fieldset>
        <legend>Yeni Klasör Ekle</legend>

        <label for="folder">Klasör ismi</label>
        <input id="folder" type="text"  name="folder" placeholder="Klasör">

        


        <button type="submit" class="pure-button button-success">Ekle</button>
    </fieldset>
</form>


            </div>
	</div>
</div>





<script src="/css/ui.js"></script>


</body>
</html>
