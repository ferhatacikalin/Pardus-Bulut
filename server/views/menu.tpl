%import urllib

<div id="menu">
        <div class="pure-menu">
            <a class="pure-menu-heading" href="#">P-bulut</a>

            <ul class="pure-menu-list">
            <li class="pure-menu-item"><a href="/folders" class="pure-menu-link"><i class="fa fa-plus"></i>&nbsp;  Klasörler</a></li>
% for catitem in catlist:
<% catitemlink=urllib.quote(catitem) %>

<li class="pure-menu-item"><a href="/list/{{catitemlink}}" class="pure-menu-link"><i class="fa fa-file"></i>&nbsp;{{catitem}}</a></li>
    
  % end

  <li class="pure-menu-item"><a href="/musicplayer" class="pure-menu-link"><i class="fa fa-music"></i>&nbsp;  Müzik Oynatıcı</a></li>
  <li class="pure-menu-item"><a href="/videoplayer" class="pure-menu-link"><i class="fa fa-play"></i>&nbsp;  Video Oynatıcı</a></li>
                <li class="pure-menu-item"><a href="/upload" class="pure-menu-link"><i class="fa fa-cloud-upload"></i>&nbsp;Dosya Yükle</a></li>
                <li class="pure-menu-item"><a href="/info" class="pure-menu-link"><i class="fa fa-server"></i>&nbsp;
Sunucu Bilgisi</a></li>

                <li class="pure-menu-item"><a href="/about" class="pure-menu-link"><i class="fa fa-info"></i>&nbsp;Sistem Hakkında</a></li>

                <li class="pure-menu-item"><a href="/logout" class="pure-menu-link"><i class="fa fa-sign-out"></i>&nbsp;Çıkış Yap</a></li>
            </ul>
        </div>
    </div>

