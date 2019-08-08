*** Settings ***
Library  pylib.SchoolTeacherLib
Library  SeleniumLibrary
Variables  cfg.py
*** Test Cases ***
添加老师1 - tc001001
    ${ret1}=    add school teacher    linguowei    linguowei    ${g_math}    ${suite_g7c1_classid}
                                 ...   15851398152    750104472@qq.com    320623199211248771    suite_g7c1_teacherid
    should be true     $ret1=={"retcode": 0,"id": ${suite_g7c1_teacherid}}

#列出班级，检验一下
    ${ret2}=    list school teacher
#    ${retlist}=   evaluate   $ret2['retlist'][0]['id']
#    should be true      $retlist==${suite_g7c1_teacherid}
    log to console  &{ret2}[retlist]
    teacherlist should contain      &{ret2}[retlist]
              ...    linguowei    linguowei    ${suite_g7c1_teacherid}
              ...    ${suite_g7c1_classid}     15851398152    750104472@qq.com    320623199211248771

    [Teardown]    delete_school_teacher   ${suite_g7c1_teacherid}

