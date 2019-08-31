*** Settings ***
Library  pylib.WebOpLib.py
Library  pylib.SchoolTeacherLib
Variables  cfg.py
Suite Setup  open browser
Suite Teardown  close browser