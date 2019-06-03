# -*- coding: utf-8 -*-
"""
Created on Tue May 21 16:38:25 2019
This script is useful for running DOE2.2 through IX. 

@author: dlvilla
"""

from subprocess import Popen, PIPE
from getopt import getopt, GetoptError
from sys import exit, argv
from os import chdir as cd
from os.path import isdir, isfile, dirname


class RunDOE22(object):
    
    def __init__(self, sfilestr):
        # process the string into a list.
        sfilelist = [item for item in sfilestr.split(" ") if len(item) != 0 and item != " "]
        sfilelist_noquotations = [item.replace("\"","") for item in sfilelist]
        # Calling from VBA the home directory must be changed or else you will
        # get a write error or the output files will end up in the wrong location
        if len(sfilelist_noquotations) == 1:
            # we are using the spreadsheet multi-run process
            cd(dirname(sfilelist_noquotations[0]))
            file_extensions = ['.bat'] 
        else:
            cd(dirname(sfilelist_noquotations[1]))
            file_extensions = ['.bat','.inp','','']        
        missing_file = [file+ext for file,ext in zip(sfilelist_noquotations,file_extensions) if not isfile(file+ext) and not isdir(file+ext)]
        if len(missing_file) != 0:
            print("The following files needed do not exist there is an error in the process")
            for item in missing_file:
                print("")
                print(item)
        p = Popen(sfilelist_noquotations,stdout=PIPE, stderr=PIPE, shell=True)
        output, errors = p.communicate()
        if not errors == b'':
           print("A batch script or a fortran DOE22.EXE error occurred!")
           print(errors)  # this will give fortran severe error if any occur
        if len(sfilelist_noquotations)!=1:  # indicates serial runs where we
            # want to wait. For the multi-processor application we do not want to wait!
            p.wait()
        

def help_string():
    return """ This script takes two command arguments "-h" and "-s." "-h" prints
               this message. "-s" requires a single string after it enclosed in 
               quotation marks with substrings also enclosed in quotation marks
               with the following arguments (no command arguments)
               
               1. Path and file name together to the DOE2_IX.BAT windows batch
                  mode script.
               2. Path and file name to the Building file
               3. Path and file name to the weather file
               4. Path to the DOE2.2 executable location
               
               For an example of this string, look at the IXDatabase2_6.accdb
               module mdlSharedFunctions subroutine DOE22Simulation. Look for 
               the sfile string. This string is the usual output to this 
               python function."""
def test_me_sfilestr():
    # put a string here that will work on your local computer!
    return """"C:\\Users\\dlvilla\\Documents\\BuildingEnergyModeling\\IX2_6\\IXData\\doe223\\batfile_3\""""
    #return """"C:\\Users\\dlvilla\\Documents\\BuildingEnergyModeling\\IX2_6\\EmptyVersionForOpenSourceRelease\\IXData\\doe22\\doe22_ix" "C:\\Users\\dlvilla\\Documents\\BuildingEnergyModeling\\IX2_6\\EmptyVersionForOpenSourceRelease\\IXData\\Temp\\Project_3_with_BuildingCalibration_ECM" "C:\\Users\\dlvilla\\Documents\\BuildingEnergyModeling\\IX2_6\\EmptyVersionForOpenSourceRelease\\IXData\\Weather\\SEATTLWA.bin" "C:\\Users\\dlvilla\\Documents\\BuildingEnergyModeling\\IX2_6\\EmptyVersionForOpenSourceRelease\\IXData\\doe22\\\""""
               
if __name__ == "__main__":
   test_me = False  # toggle this before testing
   if test_me:
       sfilestr = test_me_sfilestr()
   else:
       sfilestr = ""
       try:
         opts, args = getopt(argv[1:],"s:h",["doe2cmdstr","--help"])
         for opt, arg in opts:
             if opt in ("-s","--doe2cmdstr"):
                 try:
                     sfilestr = str(arg)
                 except:
                     print("Error")
                     print("Command argument failed to return a string")
                     print(help_string())
                     exit(2)
             elif opt in ("-h","--help"):
                 print(help_string())
                 exit(2)
             else:
                 print("Error")
                 print('Invalid command line argument option. Only "-h" and "-s" allowed')
                 
       except GetoptError:
         print("Error")
         print('Invalid command line argument option. Only "-h" and "-s" allowed')
         exit(2)
   try:
       obj = RunDOE22(sfilestr)
       print("Success")       
   except:
       print("Error")
       print("Something went wrong in the RunDOE22 python class!")
       exit(2)
       


 



