*** Settings ***
Library  pylib.SchoolTeacherLib
Library  SeleniumLibrary
Variables  cfg.py
*** Test Cases ***
添加老师2 - tc001002
    ${ret1}=    add school teacher    linguowei1    linguowei1    ${g_science}    ${suite_g7c1_classid}
                                 ...   15851398153    750104473@qq.com    320623199211248773    suite_g7c2_teacherid
    should be true     $ret1=={"retcode": 0,"id": ${suite_g7c2_teacherid}}

#列出班级，检验一下
    ${ret2}=    list school teacher
#    ${retlist}=   evaluate   $ret2['retlist'][0]['id']
#    should be true      $retlist==${suite_g7c1_teacherid}

    teacherlist should contain      &{ret2}[retlist]
              ...    linguowei1    linguowei1    ${suite_g7c2_teacherid}
              ...    ${suite_g7c1_classid}     15851398153    750104473@qq.com    320623199211248773

    [Teardown]    delete_school_teacher   ${suite_g7c2_teacherid}


添加老师3 - tc001003
    ${before}=    list school teacher
    ${ret1}=    add school teacher    linguowei    linguowei1    ${g_science}    ${suite_g7c1_classid}
                                 ...   15851398151    750104471@qq.com    320623199211248771
    should be true     $ret1['retcode']==1
    should be true     $ret1['reason']=="登录名 linguowei 已经存在"


#列出班级，检验一下
    ${ret2}=    list school teacher
    should be true   $before==$ret2


