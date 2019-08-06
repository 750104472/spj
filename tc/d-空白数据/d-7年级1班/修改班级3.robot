*** Settings ***
Library  pylib.SchoolClassLib
Library  SeleniumLibrary

*** Test Cases ***
修改班级3 - tc0000053
    ${ret1}=     list school class   1
    ${classid}=     evaluate     $ret1['retlist'][0]['id']+1

    ${ret2}=    modify school class    ${classid}    1班    80

    should be true  $ret2['retcode']==404
    should be true  $ret2['reason']=='id 为`${classid}`的班级不存在'
