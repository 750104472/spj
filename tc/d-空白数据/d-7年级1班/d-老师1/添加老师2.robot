*** Settings ***
Library  pylib.SchoolTeacherLib
Library  SeleniumLibrary
*** Test Cases ***
添加老师2 - tc001002
    ${ret1}=    add school teacher    linguowei1    linguowei1    5    ${suite_g7c1_classid}
                                 ...   15851398153    750104473@qq.com    320623199211248773    suite_g7c1_teacherid
    should be true     $ret1=={"retcode": 0,"id": ${suite_g7c1_teacherid}}

#列出班级，检验一下
    ${ret2}=    list school teacher
#    ${retlist}=   evaluate   $ret2['retlist'][0]['id']
#    should be true      $retlist==${suite_g7c1_teacherid}

    teacherlist should contain      &{ret2}[retlist]
              ...    linguowei1    linguowei1    ${suite_g7c1_teacherid}
              ...    ${suite_g7c1_classid}     15851398153    750104473@qq.com    320623199211248773

    [Teardown]    delete_school_teacher   ${suite_g7c1_teacherid}

