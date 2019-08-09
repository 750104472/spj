*** Settings ***
Library  pylib.WebOpLib
Library  pylib.SchoolTeacherLib
Variables  cfg.py
Suite Setup  open browser
Suite Teardown  close browser