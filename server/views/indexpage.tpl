<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>BULUT V.1.0</title>

    <link rel="stylesheet" href="css/pure.css">
</head>
<body bgcolor="#E6E6FA">
%if logged == 'true':
<meta http-equiv="refresh" content="0;URL=main">
%else:
    <img src="/css/pardus.png"  style="margin-left:40%;width:20% ;heigth:20%;padding-top:10%;" >

<center>
    <form class="pure-form pure-form-stacked" action="login" method="post">
    <label>Lütfen Giriş Yapın</label>
    <fieldset>
        
        <label for="password">Parola</label>
        <input id="password" name="password" type="password" placeholder="Password">
		<button type="submit" class="pure-button pure-button-primary">Giriş Yap</button>
    </fieldset>
</form>
%end
</body>
</html>