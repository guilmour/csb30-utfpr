#!/usr/bin/python
#code by Guilmour Rossi

from __future__ import division
from xml.dom.minidom import parse
import xml.dom.minidom

# Open XML document using minidom parser
DOMTree = xml.dom.minidom.parse("marvel_simplificado.xml")

universe = DOMTree.documentElement
#if universe.hasAttribute("name"):
   #print("Root element : %s" % universe.getAttribute("name"))

# Get all the heroes in the universe
heroes = universe.getElementsByTagName("hero")
n_heroes = 0
# Print detail of each hero.
for hero in heroes:
   #print("*****Hero*****")
   if hero.hasAttribute("id"):
      #print("Id: %s" % hero.getAttribute("id"))
      n_heroes = n_heroes + 1

   name = hero.getElementsByTagName('name')[0]
   #print("Name: %s" % name.childNodes[0].data)

# open the file dadosMarvel/herois.csv
f = open('dadosMarvel/herois.csv', 'w')

n_attributes = 13
attributes = ['name', 'popularity', 'alignment', 'gender', 'height_m', 'weight_kg', 'hometown', 'intelligence', 'strength', 'speed', 'durability', 'energy_Projection', 'fighting_Skills']
pesototal = 0
#print in the file info about the heroes
for hero in heroes:
   f.write("%s," % hero.getAttribute("id"))
   for x in range(0, n_attributes):
      s = hero.getElementsByTagName('%s' % attributes[x])[0]
      f.write('%s' % s.childNodes[0].data)
      if attributes[x] == "weight_kg":
         pesototal = pesototal + int(s.childNodes[0].data)
      if x < n_attributes-1:
         f.write(',')
   f.write('\n')
print('File dadosMarvel\herois.csv generated successfully!')

#closing the herois.csv file
f.close()

n_good = 0
n_bad = 0
# open the file dadosMarvel/herois_good.csv
f = open('dadosMarvel/herois_good.csv', 'w')

for hero in heroes:
   s = hero.getElementsByTagName('alignment')[0]
   if s.childNodes[0].data == "Good":
      n_good = n_good + 1
      f.write("%s," % hero.getAttribute("id"))
      for x in range(0, n_attributes):
         s = hero.getElementsByTagName('%s' % attributes[x])[0]
         f.write('%s' % s.childNodes[0].data)
         if x < n_attributes-1:
            f.write(',')
      f.write('\n')
print('File dadosMarvel\herois_good.csv generated successfully!')
f.close()

# open the file dadosMarvel/herois_good.csv
f = open('dadosMarvel/herois_bad.csv', 'w')
for hero in heroes:
   s = hero.getElementsByTagName('alignment')[0]
   if s.childNodes[0].data == "Bad":
      n_bad = n_bad + 1
      f.write("%s," % hero.getAttribute("id"))
      for x in range(0, n_attributes):
         s = hero.getElementsByTagName('%s' % attributes[x])[0]
         f.write('%s' % s.childNodes[0].data)
         if x < n_attributes-1:
            f.write(',')
      f.write('\n')
print('File dadosMarvel\herois_bad.csv generated successfully!')
f.close()

# calculando IMC Hulk

for hero in heroes:
   s = hero.getElementsByTagName('name')[0]
   if s.childNodes[0].data == "Hulk":
      for x in range(0, n_attributes):
         s = hero.getElementsByTagName('%s' % attributes[x])[0]
         if attributes[x] == "height_m":
            imc = int(s.childNodes[0].data)
         if attributes[x] == "weight_kg":
            imc = (int(s.childNodes[0].data))/(imc*imc)


print('No nosso mini-universo Marvel, %d herois sao bons e %d herois sao maus.' % (n_good, n_bad)) 
print('A media de peso de nossos herois eh de: %dkg' % (pesototal/n_heroes))
print('O IMC do Hulk eh: %d' % imc)
