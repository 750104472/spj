*** Settings ***
Library  pylib.SchoolClassLib
Library  SeleniumLibrary

*** Test Cases ***
添加班级2 - tc000002
    ${ret1}=    add school class    1     2班     60
    should be true     $ret1['retcode']==0

#列出班级，检验一下
    ${ret2}=    list school class    1
    ${retlist}=   evaluate   $ret2['retlist']
    should be true      { 'grade__name': '七年级','id': $ret1['id'],'invitecode': $ret1['invitecode'],'name': '2班','studentlimit': 60,'studentnumber': 0,'teacherlist': []} in $retlist

    [Teardown]    delete_school_class   &{ret1}[id]

添加班级3 - tc000003
    ${list_before}=    list school class    1

    ${ret1}=    add school class    1     1班     60
    should be true  $ret1['retcode']==1
    should be true  $ret1['reason']=="duplicated class name"

    ${list_after}=    list school class    1

    should be equal     ${list_before}    ${list_after}