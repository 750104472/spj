*** Settings ***
Library  pylib.WebOpLib
Library  pylib.SchoolTeacherLib
Library  pylib.SchoolStudentLib
Variables  cfg.py
#Suite Setup  open browser
#Suite Teardown  close browser
*** Test Cases ***
老师登录2 -- tc005081
    ${student}=    add school student    student    student    1    ${suite_g7c1_classid}
                           ...     15851398152
    student login   student    888888
    ${homepageinfo}=    get student homepage info
    ${studentinfo}=    get student wrongquestions info


    should be true  $homepageinfo==['student', '松勤学院00520', '0', '0']
    should be true  $studentinfo=='您尚未有错题入库哦'


    delete school student  &{student}[id]
