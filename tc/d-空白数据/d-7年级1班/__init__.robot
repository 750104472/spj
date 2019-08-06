*** Settings ***
Library  pylib.SchoolClassLib
Suite Setup      add school class     1     1班     60
Suite Teardown      delete all school classes