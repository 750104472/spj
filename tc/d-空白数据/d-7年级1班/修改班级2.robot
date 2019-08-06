*** Settings ***
Library  pylib.SchoolClassLib
Library  SeleniumLibrary

*** Test Cases ***
修改班级2 - tc0000052
    ${ret1}=     list school class   1
    ${classid}=     evaluate     $ret1['retlist'][0]['id']

    ${ret2}=    modify school class    ${classid}    1班    80

    should be true  $ret2['retcode']==1
    should be true  $ret2['reason']=='duplicated class name'

    ${ret3}=     list school class   1
    should be equal  ${ret3}    ${ret1}