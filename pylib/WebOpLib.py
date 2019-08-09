from selenium import webdriver
import cfg
import time
import pprint

class WebOpLib:
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'

    def open_browser(self):
        self.wd = webdriver.Chrome()
        self.wd.implicitly_wait(10)

    def close_browser(self):
        self.wd.quit()


    def teacher_login(self,username,password):
        self.wd.get(cfg.g_teacher_login_url)

        self.wd.find_element_by_id('username').send_keys(username)
        self.wd.find_element_by_id('password').send_keys(password)
        self.wd.find_element_by_id('submit').click()

        self.wd.find_element_by_id('home_div')


    def get_teacher_homepage_info(self):
        self.wd.find_element_by_css_selector("a[href = '#/home']>li").click()
        # self.wd.find_element_by_id('home_div')
        time.sleep(2)
        eles = self.wd.find_elements_by_css_selector(".ng-binding")[1:]
        result = [ele.text for ele in eles]
        pprint.pprint(result)
        return result

    def get_teacher_class_students_info(self):
        self.wd.find_element_by_css_selector(".main-menu ul li:nth-of-type(4)").click()
        self.wd.find_element_by_css_selector("a[href='#/student_group']>li span").click()
        time.sleep(2)

        classStudentTable = {}
        classes = self.wd.find_elements_by_css_selector("div.panel-green")

        for cla in classes:
            gradeclass = cla.find_element_by_css_selector(".panel-heading")

            title = gradeclass.text.replace(' ','')
            gradeclass.click()
            time.sleep(1)
            student = cla.find_element_by_css_selector(".panel-body>:nth-child(2)").text
            classStudentTable[title] = student
        pprint.pprint(classStudentTable)
        return classStudentTable


if __name__ == '__main__':
    webop = WebOpLib()
    webop.open_browser()
    webop.teacher_login('teacher',888888)
    webop.get_teacher_homepage_info()
    webop.get_teacher_class_students_info()
    webop.close_browser()

