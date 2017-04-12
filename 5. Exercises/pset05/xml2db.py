# guilmour.com
#!/usr/bin/python
#
# Conectando ao servidor e testes
#

from __future__ import print_function
import psycopg2
from xml.dom.minidom import parse
from xml.dom import minidom
import wget
import os


try:
    conn = psycopg2.connect("dbname='pset05' user='guilmour' host='localhost' password='#senha' port=5433")
except:
    print("Erro ao conectar.")

cur = conn.cursor()


# string = 'persons'
# cur.execute("SELECT * FROM %s" % (string))
#
# rows = cur.fetchall()
#
# print("Mostrando valores:")
# for row in rows:
#     print("- ", row[0], ", ", row[1], ", ", row[2], sep='')


#Inserindo Pessoas
teste = wget.download('http://dainf.ct.utfpr.edu.br/~gomesjr/BD1/data/person.xml')

xmldoc = minidom.parse('person.xml')
itemlist = xmldoc.getElementsByTagName('Person')
print(len(itemlist))
for s in itemlist:
    login = s.attributes['uri'].value
    if login.startswith("http://utfpr.edu.br/CSB30/2017/1/"):
        login = login[33:]
    print(login)
    print(s.attributes['name'].value)
    name = s.attributes['name'].value
    print(s.attributes['hometown'].value)
    hometown = s.attributes['hometown'].value
    try:
        cur.execute("INSERT INTO persons VALUES (%s, %s, %s)", (login, name, hometown))
    except:
        print("Erro ao inserir.")
os.remove("person.xml")


#Inserindo Likes Music
teste = wget.download('http://dainf.ct.utfpr.edu.br/~gomesjr/BD1/data/music.xml')

xmldoc = minidom.parse('music.xml')
itemlist = xmldoc.getElementsByTagName('LikesMusic')
print(len(itemlist))
for s in itemlist:
    login = s.attributes['person'].value
    if login.startswith("http://utfpr.edu.br/CSB30/2017/1/"):
        login = login[33:]
    print(login)
    print(s.attributes['rating'].value)
    rating = s.attributes['rating'].value
    print(s.attributes['bandUri'].value)
    bandUrl = s.attributes['bandUri'].value
    try:
        cur.execute("INSERT INTO alllikesmusic VALUES (%s, %s, %s)", (login, rating, bandUrl))
    except:
        print("Erro ao inserir.")

os.remove("music.xml")

#Inserindo Likes Movies
teste = wget.download('http://dainf.ct.utfpr.edu.br/~gomesjr/BD1/data/movie.xml')

xmldoc = minidom.parse('tmp/movie.xml') #mudar quando prf remover tupla duplicada
itemlist = xmldoc.getElementsByTagName('LikesMovie')
print(len(itemlist))
for s in itemlist:
    login = s.attributes['person'].value
    if login.startswith("http://utfpr.edu.br/CSB30/2017/1/"):
        login = login[33:]
    print(login)
    print(s.attributes['rating'].value)
    rating = s.attributes['rating'].value
    print(s.attributes['movieUri'].value)
    movieUrl = s.attributes['movieUri'].value
    cur.execute("INSERT INTO alllikesmovies VALUES (%s, %s, %s)", (login, rating, movieUrl))

os.remove("movie.xml")

#Inserindo All Knows
teste = wget.download('http://dainf.ct.utfpr.edu.br/~gomesjr/BD1/data/knows.xml')

xmldoc = minidom.parse('knows.xml') #mudar quando prf remover tupla duplicada
itemlist = xmldoc.getElementsByTagName('Knows')
print(len(itemlist))
for s in itemlist:
    login = s.attributes['person'].value
    if login.startswith("http://utfpr.edu.br/CSB30/2017/1/"):
        login = login[33:]
    print(login)

    colleague = s.attributes['colleague'].value
    if colleague.startswith("http://utfpr.edu.br/CSB30/2017/1/"):
        colleague = colleague[33:]
    print(colleague)

    cur.execute("INSERT INTO allknows VALUES (%s, %s)", (login, colleague))

os.remove("knows.xml")

print("Dados inseridos ao database server com sucesso!")

conn.commit()
conn.close()
