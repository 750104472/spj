*** Settings ***
Library  pylib.SchoolClassLib
Library  SeleniumLibrary

*** Test Cases ***
删除班级1 - tc0000081
    ${ret1}=     list school class   1
    ${classid}=     evaluate     $ret1['retlist'][0]['id']+1

    ${ret2}=    delete school class    ${classid}

    should be true  $ret2['retcode']==404
    should be true  $ret2['reason']=='id 为`${classid}`的班级不存在'
