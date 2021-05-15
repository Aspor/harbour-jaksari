"""
Created on Thu Jul 25 11:54:27 2019

@author: aspor
"""
import json
from pathlib import Path
import collections



path = Path('PeriodicTableJSON.json')
file = path.open();
elements = json.load(file);
#print (elements['elements'][0]['color'])



#path2 = Path('data.json')
#file2 = path2.open();
#elements2 = json.load(file2);
#print (elements2['elements'][4][4])

maxElectronAff=1
minElectronAff=10000000
maxElectroNeg=1
minElectNeg=1000000000

valueSet = set();
keySet = set()

for i, element in enumerate (elements['elements']):
    if(i<118):
        for key in element:
            keySet.add('QT_TRANSLATE_NOOP("ElementDetails ", "'+key +'")')  
            if(isinstance(element[key],  type("string"))) and key != "source" and key !="spectral_img"  and key != "summary" and key != "electron_configuration"  and key != "symbol" and key != "color":
                val = element[key];
                val = val[0].upper() +val [1:]
                valueSet.add('QT_TRANSLATE_NOOP("ElementDetails", "'+ val +'")')    
                #print ('QT_TR_NOOP("'+ element[key] +'");')
            
