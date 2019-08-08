*** Settings ***
Library  pylib.SchoolClassLib
Library  pylib.SchoolTeacherLib
Library  pylib.SchoolStudentLib
Suite Setup     Run Keywords    delete all school teachers    AND
                      ...     delete all school students      AND
                      ...     delete all school classes