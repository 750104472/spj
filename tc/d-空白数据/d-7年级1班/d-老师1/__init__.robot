*** Settings ***
Library  pylib.SchoolTeacherLib
Suite Setup    add school teacher        linguowei    linguowei    1    ${suite_g7c1_classid}
                                 ...   15851398152    750104472@qq.com    320623199211248771    suite_g7c1_teacherid
Suite Teardown    delete school teacher      ${suite_g7c1_teacherid}