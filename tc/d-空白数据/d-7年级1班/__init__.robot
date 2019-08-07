
*** Settings ***
Library  pylib.SchoolClassLib
Suite Setup      add school class    1    1班    60    suite_g7c1_classid
Suite Teardown      delete school class       ${suite_g7c1_classid}