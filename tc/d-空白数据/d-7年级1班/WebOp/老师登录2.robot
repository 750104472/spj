*** Settings ***
Library  pylib.WebOpLib
Library  pylib.SchoolTeacherLib
Library  pylib.SchoolStudentLib
Variables  cfg.py
#Suite Setup  open browser
#Suite Teardown  close browser
*** Test Cases ***
老师登录2 -- tc005002
    ${student}=    add school student    student    student    1    ${suite_g7c1_classid}
                           ...     15851398152    init_studentid

    ${ret1}=    add school teacher      teacher    teacher    ${g_math}    ${suite_g7c1_classid}
                                 ...   15851398152    750104472@qq.com    320623199211248771    suite_g7c1_teacherid
    teacher login   teacher    888888
    ${teacherinfo}=    get teacher class students info
    ${homepageinfo}=    get teacher homepage info
    should be true  $teacherinfo=={'七年级1班': ['student']}
    should be true  $homepageinfo==['松勤学院00520', 'teacher', '初中数学', '0', '0', '0']

    delete school teacher  &{ret1}[id]
    delete school student  &{student}[id]
