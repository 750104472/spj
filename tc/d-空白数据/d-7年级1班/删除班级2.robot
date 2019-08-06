*** Settings ***
Library  pylib.SchoolClassLib
Library  SeleniumLibrary

*** Test Cases ***
删除班级1 - tc0000081
    ${ret1}=     list school class   1
    ${classid}=     evaluate     $ret1['retlist'][0]['id']

    ${ret2}=    delete school class    ${classid}

    should be true  $ret2['retcode']==0

    ${ret3}=     list school class   1
    ${var1}=     evaluate  $ret3['retlist']
    should be true  $var1==[]



