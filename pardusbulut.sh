#!/usr/bin/python
# -*- coding: utf-8 -*-
import sys
import os
def bilgi():
	print "-baslat\t\tsunucuyu başlatır.\n-kapat\t\tsunucuyu kapatır.\n-ayar\t\tsunucu ayarlarını açar."
dizin=os.getcwd()
os.chdir('server') 
if len(sys.argv)==1:
	bilgi()
	sys.exit(0)
if sys.argv[1]=="-baslat":
	os.system("python server.py")
elif sys.argv[1]=="-kapat":
	os.system("python stop.py")
elif sys.argv[1]=="-ayar":
	os.system("python ayar.py")
else:
	print"geçerli argüman girin"
	bilgi()
	