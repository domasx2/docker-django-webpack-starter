import time
from apps.testutils import SeleniumTestCase

class SampleTests(SeleniumTestCase):

    def test_something(self):
        self.driver.get(self.live_server_url)
        p = self.driver.find_element_by_css_selector('p')
        self.assertEqual(p.text, 'hello world')