*** Settings ***
Library  pylib.SchoolStudentLib


*** Test Cases ***
添加学生2 - tc002002


    ${ret1}=     add school student  linguowei222    linguowei222    1    ${suite_g7c1_classid}
                           ...     15851398152    case1_studentid
    should be true  $ret1['retcode']==0
    should be true  $ret1['id']==${case1_studentid}


    ${ret2}=    list school student
    log to console  &{ret2}[retlist]
    studentlist should contain  &{ret2}[retlist]
                          ...   linguowei222    linguowei222     ${suite_g7c1_classid}    15851398152    ${case1_studentid}

    [Teardown]  delete school student  ${ret1}[id]



删除学生1 - tc002081
    ${ret1}=    delete school student    ${init_studentid}
    should be true  $ret1['retcode']==0

    ${ret2}=    list school student

    should be true  $ret2['retlist']==[]