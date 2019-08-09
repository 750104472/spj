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

    def student_login(self,username,password):
        self.wd.get(cfg.g_student_login_url)

        self.wd.find_element_by_id('username').send_keys(username)
        self.wd.find_element_by_id('password').send_keys(password)
        self.wd.find_element_by_id('submit').click()

        self.wd.find_element_by_css_selector('.main-menu')


    def get_teacher_homepage_info(self):
        self.wd.find_element_by_css_selector("a[href = '#/home']>li").click()
        self.wd.find_element_by_id('home_div')
        time.sleep(2)
        eles = self.wd.find_elements_by_css_selector(".ng-binding")[1:]
        result = [ele.text for ele in eles]
        pprint.pprint(result)
        return result

    def get_student_homepage_info(self):
        self.wd.find_element_by_css_selector("a[href = '#/home']>li").click()

        self.wd.find_element_by_css_selector('.table>tbody')
        time.sleep(1)
        eles = self.wd.find_elements_by_css_selector(".ng-binding")[2:]
        result = [ele.text for ele in eles]
        result.pop(-3)
        pprint.pprint(result)
        return result

    def get_student_wrongquestions_info(self):
        self.wd.find_element_by_css_selector("a[href='#/yj_wrong_questions']>li").click()
        time.sleep(1)
        message = self.wd.find_element_by_css_selector(".row>div span").text
        pprint.pprint(message)
        return message


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
            self.wd.implicitly_wait(0)
            studentEles = cla.find_elements_by_css_selector("tr>td:nth-child(2)")
            self.wd.implicitly_wait(10)
            names = [ele.text for ele in studentEles]
            classStudentTable[title] = names
        pprint.pprint(classStudentTable)
        return classStudentTable

    def publish_jobs(self):
        self.wd.find_element_by_css_selector(".topbar-main div>ul li:nth-of-type(2)").click()
        self.wd.find_element_by_css_selector(".topbar-main div>ul li:nth-of-type(2) .fa-plus+span").click()
        time.sleep(2)
        self.wd.find_element_by_id("exam_name_text").send_keys('作业')
        time.sleep(2)
        self.wd.find_element_by_id("btn_pick_question").click()
        time.sleep(2)
        self.wd.switch_to.frame("pick_questions_frame")



        for counter in range(3):
            questions = self.wd.find_elements_by_css_selector(".btn_pick_question")
            questions[counter].click()
            time.sleep(1)

        self.wd.find_element_by_css_selector("#question_cart #cart_footer .btn-group .btn-blue").click()

        self.wd.switch_to.default_content()
        time.sleep(1)
        self.wd.find_element_by_css_selector("button[class = 'btn btn-green ng-scope']").click()
        time.sleep(1)
        self.wd.find_element_by_css_selector(".bootstrap-dialog-footer-buttons button:nth-child(2)").click()
        time.sleep(2)

        mainWindow = self.wd.current_window_handle
        for handle in self.wd.window_handles:
            self.wd.switch_to.window(handle)
            if "下发学习任务" in self.wd.title:
                print("进入到下发学习任务窗口")
                break
        time.sleep(1)
        self.wd.find_element_by_css_selector(".ng-binding>.myCheckbox").click()
        time.sleep(0.5)
        self.wd.find_element_by_css_selector("button[class='btn btn-blue btn-outlined']").click()
        time.sleep(0.5)
        self.wd.find_element_by_css_selector("button[ng-click='dispatchIt()']").click()
        self.wd.find_element_by_css_selector(".bootstrap-dialog-footer-buttons button").click()
        self.wd.switch_to.window(mainWindow)

    def do_jobs(self):
        self.wd.find_elements_by_css_selector("table[class='table table-striped table-hover']")
        self.wd.find_element_by_css_selector("a[ng-click='task.refresh_notify_tasks()']").click()
        time.sleep(0.5)
        self.wd.find_element_by_css_selector("a[ng-click='task.checkOneNotifiedTask(oneTask)']").click()
        time.sleep(1)
        self.wd.find_element_by_css_selector("button[ng-click='viewTask(taskTrack)']").click()
        time.sleep(1)

        for i in range(3):
            eles = self.wd.find_elements_by_css_selector(".btn-group button:nth-child(1)")
            eles[i].click()
            time.sleep(1)

        self.wd.find_element_by_css_selector("button[ng-click='saveMyResult(true)']").click()
        time.sleep(0.5)
        self.wd.find_element_by_css_selector(".bootstrap-dialog-footer-buttons button:nth-child(2)").click()


    def check_jobs(self):
        self.wd.find_elements_by_css_selector("table[class='table table-striped table-hover']")
        self.wd.find_element_by_css_selector(".topbar-main div>ul li:nth-of-type(2)").click()
        self.wd.find_element_by_css_selector(".topbar-main div>ul li:nth-of-type(2) .fa-bell-o+span").click()
        time.sleep(2)
        self.wd.find_element_by_css_selector("a[ng-click='trackTask(task)']").click()
        time.sleep(2)
        self.wd.find_element_by_css_selector("button[ng-click^='viewTaskTrack']").click()

        mainwindow = self.wd.current_window_handle
        for handle in self.wd.window_handles:
            self.wd.switch_to.window(handle)
            if "查看作业" in self.wd.title:
                break
        time.sleep(1)

        eles = self.wd.find_elements_by_css_selector("label.myCheckbox input:checked")
        selectchoices = [ele.find_element_by_xpath('./..').text.strip() for ele in eles]
        print(selectchoices)

        self.wd.switch_to.window(mainwindow)
        return selectchoices



if __name__ == '__main__':
    # webop = WebOpLib()
    # webop.open_browser()
    # webop.teacher_login('teacher',888888)
    # webop.get_teacher_homepage_info()
    # webop.get_teacher_class_students_info()
    # webop.close_browser()
    #
    # webop = WebOpLib()
    # webop.open_browser()
    # webop.student_login('student', 888888)
    # webop.get_student_homepage_info()
    # webop.get_student_wrongquestions_info()
    # webop.close_browser()
    #
    # webop = WebOpLib()
    # webop.open_browser()
    # webop.teacher_login('teacher', 888888)
    # webop.publish_jobs()
    # webop.close_browser()
    # time.sleep(2)
    # webop = WebOpLib()
    # webop.open_browser()
    # webop.student_login('student', 888888)
    # webop.do_jobs()
    # webop.close_browser()

    webop = WebOpLib()
    webop.open_browser()
    webop.teacher_login('teacher', 888888)
    webop.check_jobs()
    webop.close_browser()

