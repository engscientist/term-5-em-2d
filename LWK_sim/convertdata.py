frequencylist = ['1950', '2000', '2053.3']
parameternamelist = ['s1,1', 's1,2', 's2,1', 's2,2']
frequencylistdiff = ['1950', '2000', '20533']
parameternamelistdiff = ['S11', 'S12', 'S21', 'S22']
filenamelist = []
rowdict = {'c=0.135': (1007, 2007), 'c=0.140': (1007, 2007), 'c=0.145': (2011, 3011), 'c=0.150': (3015, 4015)}
fileindex = 0
simulationresultsdict = {}

import numpy as np
import scipy.io
import copy

def processline(lineinp):
	linesplitlist = lineinp.split(' ')
	processedlist = []
	for linesplitlistitem in linesplitlist:
		if not(linesplitlistitem in ['', ' ']):
			if '\n' in linesplitlistitem:
				processedlistappend = linesplitlistitem[:-1]
			else:
				processedlistappend = linesplitlistitem
			processedlist += [processedlistappend]
	processedlistfloat = []
	for processedlistitem in processedlist:
		processedlistfloat += [float(processedlistitem)]
	return processedlistfloat

def getvariablename(fileindexinp):
	frequencypart = frequencylistdiff[fileindexinp // 4]
	parameternamepart = parameternamelistdiff[fileindexinp % 4]
	return 'Fr' + frequencypart + parameternamepart

for frequency in frequencylist:
	for parametername in parameternamelist:
		newfilename = frequency + '_' + parametername + '.txt'
		filenamelist += [newfilename]

for filename in filenamelist:
	f = open(filename, "r")
	a = f.readlines()
	totalconcfreqlist = []
	for conc in rowdict:
		indextuple = rowdict[conc]
		cstartindex = indextuple[0]
		cendindex = indextuple[1]
		concfreqlist = []
		for freqindex in range(cstartindex, cendindex):
			linestring = a[freqindex]
			processedlinestring = processline(linestring)
			concfreqlist += [processedlinestring[1]]
		totalconcfreqlist += [concfreqlist]
	totalconcfreqlist = np.array(totalconcfreqlist)
	totalconcfreqlist = np.transpose(totalconcfreqlist)
	newvarname = getvariablename(fileindex)
	simulationresultsdict[newvarname] = totalconcfreqlist
	fileindex += 1

concfreqlist = []

for freqindex in range(cstartindex, cendindex):
	linestring = a[freqindex]
	processedlinestring = processline(linestring)
	concfreqlist += [processedlinestring[0]]

xaxis = [concfreqlist]
xaxis = np.array(xaxis)

simulationresultsdict['x'] = xaxis

scipy.io.savemat('simulationresults.mat', simulationresultsdict)







