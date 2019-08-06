*** Settings ***
Library  pylib.SchoolClassLib
Library  SeleniumLibrary

*** Test Cases ***
修改班级1 - tc0000051
    ${ret1}=     list school class   1
    ${classid}=     evaluate     $ret1['retlist'][0]['id']

    ${ret2}=    modify school class    ${classid}    1班啊    80

    should be true  $ret2['retcode']==0

    ${ret3}=     list school class   1
    ${classname}=     evaluate     $ret3['retlist'][0]['name']
    should be equal  ${classname}    1班啊
#或者    should be true    $classname=='1班啊'
