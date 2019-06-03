The current version of IX (2.6) works with doe2.2-48z 

Instructions for getting doe2.2-48z installed into IX:
1. Download doe2.2-48z (date 7/05/2017) http://doe2.com/DOE2/index.html

2. Fill out an end-user license agreement with J. Hirsch and Associates and send it to them.

3. Get the password from J. Hirsch and unzip doe2.2-48z into a temporary folder.

4. Transfer the "dll32", "exent", "src", and "UTIL32" from the unzipped doe2.2-48z folder into 
   IXData/doe22.  Do not transfer the *.BAT scripts because IX requires custom batch scripts to run
   correctly. 

5. See if you can run an IX scenario successfully. You can also test by checking in or out a file
   in the IX data base IXDatabase2_6.accdb. Refer to the IX2.6 user manual to figure out how to do 
   these things.

Notes on python:

IX will try to run by accessing running a batch file via a shell script. This has become a very common
method to hack into systems though and anti-virus software often block such operation. If blocked,
IX will first attempt to use python to run the script instead. It will ask you where python is.
If you do not have python, you can download the anaconda version from:

https://www.anaconda.com/distribution/

If you need a more lightweight version, you can get basic python from:

https://www.python.org/downloads/

You may then have to get the subprocess and getopt libraries from https://pypi.org/
You will have to search the web on how to add libraries to python using "pip" 

If you cannot install python, and your anti-virus blocks shell calls to batch scripts, then
IX will allow you to copy and paste the needed batch script run command into and command shell
and run it manually. This is very inefficient and may require several manual commands to complete a 
scenario.


