#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
Bu kaynak kod Ferhat Açıkalın Tarafından Pardus ARM için yazılmıştır.
"""
from bottle import*

import os
import urllib
import shutil
import sys
from ConfigParser import SafeConfigParser
import codecs



parser = SafeConfigParser()
with codecs.open('system.ini', 'r') as f:
	parser.readfp(f)
parola=parser.get('user', 'password')
anahtar=parser.get('user', 'key')
	
def catlist():
	return os.listdir(os.getcwd()+"/files")
def filelist(target):
	return os.listdir(os.getcwd()+"/files/"+target)	
def checklogin():
	defparo=request.get_cookie("account", secret=anahtar)
	if defparo==parola:
		return 'true'
	else:
		return 'false'	

@route('/')
def index():
	
    return template('indexpage',logged=checklogin())
@route('/main')
def main():
	if checklogin()=='false':
		redirect('/')
	else:	
		return template('mainpage',catlist=catlist())
@post('/closeserver')
@route('/closeserver',method='POST')
def main():
	parser2 = SafeConfigParser()
	with codecs.open('token.ini', 'r') as f2:
		parser2.readfp(f2)
	if str(parser2.get('token','key'))==str(request.forms.get('key')):
		sys.stderr.close()
	else:
		return "hata"
	
@route('/list/<listname>')
def mainlist(listname):
	if checklogin()=='false':
		redirect('/')
	else:
		#listname=urllib.unquote(listname).decode('utf8') 
		return template('filelist',filelist=filelist(listname),catlist=catlist(),title=listname)
@route('/deletefile/<cate>/<fileid>')
def mainlistdelete(cate,fileid):
	if checklogin()=='false':
		redirect('/')
	else:
		#cate1=urllib.unquote(cate).decode('utf8') 
		#fileid1=urllib.unquote(fileid).decode('utf8') 
		if os.remove(os.getcwd()+"/files/"+cate+"/"+fileid):
			redirect('/list/'+cate)
		else:
			redirect('/list/'+cate)
@route('/deletefolder/<folder>/true')
def mainlistfolderdelete(folder):
	if checklogin()=='false':
		redirect('/')
	else:
		
		if shutil.rmtree(os.getcwd()+"/files/"+folder):
			redirect('/folders')
		else:
			redirect('/folders')

@route('/upload')
def mainup():
	if checklogin()=='false':
		redirect('/')
	else:	
		return template('uploadpage',catlist=catlist())
@route('/folders')
def folders():
	if checklogin()=='false':
		redirect('/')
	else:	
		return template('folders',catlist=catlist())
@route('/thumb/<catresim>/<fileresim>')
def mainup(catresim,fileresim):
	if checklogin()=='false':
		redirect('/')
	else:	
		return template('thumb',catresim=catresim,fileresim=fileresim,catlist=catlist())
@route('/music/<catmusic>/<music>')
def mainupmusic(catmusic,music):
	if checklogin()=='false':
		redirect('/')
	else:	
		return template('music',catmusic=catmusic,music=music,catlist=catlist())
@route('/musicplayer')
def mainupmusicplayer():
	if checklogin()=='false':
		redirect('/')
	else:	
		return template('musicplayer',catlist=catlist())
@route('/videoplayer')
def mainupvideoplayer():
	if checklogin()=='false':
		redirect('/')
	else:	
		return template('videoplayer',catlist=catlist())
@route('/video/<catvideo>/<video>')
def mainupvideo(catvideo,video):
	if checklogin()=='false':
		redirect('/')
	else:	
		return template('video',catvideo=catvideo,video=video,catlist=catlist())

@route('/login')
@post('/login') 
def login():
	password = request.forms.get('password') 
	if password == parola:
		response.set_cookie("account", password, secret=anahtar)
		redirect('/')
	else:
		redirect('/')
@route('/addfolder')
@post('/addfolder') 
def folderadd():
	foldrname = request.forms.get('folder') 
	if not os.path.exists("files/"+foldrname):
		os.makedirs("files/"+foldrname)
		redirect('/')
	else:
		redirect('/')
@route('/css/<filename>')
def server_static(filename):
    return static_file(filename, root='css')

@route('/downloads/<caty>/<filenames>')
def server_statics(filenames,caty):
    return static_file(filenames, root='files/'+caty)

@route('/css/layouts/<filenames>')
def server_statics(filenames):
    return static_file(filenames, root='css/layouts')
@route('/logout')
def delete_cookiespage():
	response.set_cookie("account", '', secret=anahtar)
	redirect('/')
@route('/uploadup', method='POST')
def do_upload():
	category   = request.forms.get('cat')
	upload     = request.files.get('upload')
	name, ext = os.path.splitext(upload.filename)
	category1=urllib.unquote(category).decode('utf8')

	tarpat=os.getcwd()+"/files/"+category1
	save_path=tarpat
	upload.save(save_path)
	redirect("/list/"+category)
@route('/playlist/<server>')
def playlist(server):
	response.set_header('Content-Type', 'text/plain;charset=utf-8')
	return template('playlist',server=server)

@route('/info')
def info():
	return template('infopage')
@route('/about')
def info():
	return template('about',catlist=catlist())
debug(True)


run(host="0.0.0.0", port=parser.get('network', 'port'))
	






