@echo off

echo Preparing Path: %cd%...

echo Preparing CA directory...
mkdir DoD\CA\public
mkdir DoD\CA\crl
mkdir DoD\CA\newcerts
mkdir DoD\CA\private
type nul > DoD\CA\index.txt
echo 1000 > DoD\CA\serial

echo Preparing Intermediate directory...
type nul > DoD\CA\Intermediate\index.txt
echo 1000 > DoD\CA\Intermediate\serial
echo 1000 > DoD\CA\Intermediate\crlnumber
mkdir DoD\CA\Intermediate\public
mkdir DoD\CA\Intermediate\crl
mkdir DoD\CA\Intermediate\csr
mkdir DoD\CA\Intermediate\newcerts
mkdir DoD\CA\Intermediate\private

echo Preparing Signing directory...
type nul > DoD\CA\Signing\index.txt
echo 1000 > DoD\CA\Signing\serial
echo 1000 > DoD\CA\Signing\crlnumber
mkdir DoD\CA\Signing\public
mkdir DoD\CA\Signing\crl
mkdir DoD\CA\Signing\csr
mkdir DoD\CA\Signing\newcerts
mkdir DoD\CA\Signing\private