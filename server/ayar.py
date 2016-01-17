#!/usr/bin/env python
# -*- coding: utf-8 -*-
from ConfigParser import SafeConfigParser
import codecs
import sys
parser = SafeConfigParser()
with codecs.open('system.ini', 'rw') as f:
	parser.readfp(f)
print"------------Pardus Bulut Ayarlar----------\n\n"
print"(1)Parolayı ayarla\n(2)Çerez şifreleme kilidini değiştir\n(3)Port Ayarı\n"

islem=input("Lütfen Yapmak İstediğiniz İşlemin Numarasını Yazın\n")
if islem==1:
    yeniparola=raw_input("Yeni bir parola yazın:\n")
    tekrarparola=raw_input("Doğrulamak için tekrar yazın:\n")
    if yeniparola==tekrarparola:
	parser.set('user','password',yeniparola)
        print"Başarıyla Değiştirildi"
    else:
	print"Aynı olduklarından emin olup tekrar deneyin.!"
if islem==2:
    yenikilit=raw_input("Lütfen kilit girin.(Bu kilit çerezleri şifrelemek için kullanılır)\n")
    if not (yenikilit==""):
	parser.set('user','key',yenikilit)
        print"Kilit değiştirildi"
    else:
	print"Lütfen geçerli bir kilit giriniz.!"
if islem==3:
    yeniport=input("Lütfen yeni çalışma portunu giriniz.\n")
    if len(str(yeniport))<=5:
	parser.set('network','port',str(yeniport))
        print"Çalışma portu değiştirildi"
    else:
	print"Lütfen geçerli bir port numarası giriniz.!"
with open('system.ini', 'wb') as configfile:
    parser.write(configfile)
