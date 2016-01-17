#!/usr/bin/env python
# -*- coding: utf-8 -*-
print "sunucu durduruluyor"
from ConfigParser import SafeConfigParser
import codecs
parser = SafeConfigParser()
with codecs.open('token.ini', 'r') as f:
	parser.readfp(f)
parser2 = SafeConfigParser()
with codecs.open('system.ini', 'r') as f2:
	parser2.readfp(f2)
import urllib2, urllib
import uuid
import os
def my_random_string(string_length=10):
    random = str(uuid.uuid4()) 
    random = random.replace("-","") 
    return random[0:string_length] 
parser.set('token','key',my_random_string(15))
with open('token.ini', 'wb') as configfile:
    parser.write(configfile)
key=parser.get('token','key')
mydata=[('key',key)]   #The first is the var name the second is the value
mydata=urllib.urlencode(mydata)

path="http://"+"0.0.0.0:"+parser2.get('network', 'port')+"/closeserver"   #the url you want to POST to
try:
	req=urllib2.Request(path, mydata)
	req.add_header("Content-type", "application/x-www-form-urlencoded")
	page=urllib2.urlopen(req).read()
	print "sunucu durduruldu."
except:
	print "sunucu zaten kapalı."
