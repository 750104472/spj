*** Settings ***
Library  pylib.SchoolStudentLib

Suite Setup  add school student    student    student    1    ${suite_g7c1_classid}
                           ...     15851398152    init_studentid
Suite Teardown  delete school student      ${init_studentid}
