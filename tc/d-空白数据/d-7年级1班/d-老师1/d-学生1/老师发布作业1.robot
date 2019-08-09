*** Settings ***
Library  pylib.WebOpLib
Library  pylib.SchoolStudentLib
Variables  cfg.py
Suite Setup  open browser
Suite Teardown  close browser


*** Test Cases ***
老师发布作业1 - tc005101

    teacher login     teacher    888888
    publish_jobs

    student login     student    888888
    do jobs

    teacher login    teacher     888888
    ${results}=    check jobs
    should be true  $results==['A', 'A', 'A']

