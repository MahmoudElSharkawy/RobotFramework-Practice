# RobotFramework-Practice
Practicing Robot Framework using **Browser Library** for Web GUI Test Automation and **Requests Library** for APIs Test Automation

## **Project Design**:
We are implementing the **Object Model** design pattern (**Page Object Model** for GUI). And below is the project structure folders:
* **Object Models** folder: Includes the **APIs** clustered by the services and **GUI Pages** 
* **Tests** folder: Includes all of our **Test Suites** and **Test Cases** 
* **Resources** folder: Includes any other files that aren't keywords/code/actions like **Global Variables**, **Test Data** files, etc...
* **Utilities** folder: Includes the common global utility keywords/code/actions to be used in other folders, mainly the Object Models and Tests

## **Setup**:
1. Install [**Python™**](https://www.python.org/downloads/)
2. Install [**Node.js®**](https://nodejs.org/en/download/)
3. Open a terminal/commandline windows and **Install Robot Framework** from PyPi with pip: ```pip install robotframework```
4. Install [**Browser Library**](https://marketsquare.github.io/robotframework-browser/Browser.html): ```pip install robotframework-browser``` then initialize it: ```rfbrowser init```. If rfbrowser is not found/installed for any reason, try ```python -m Browser.entry init``` 
5. Install [**Requests library**](https://marketsquare.github.io/robotframework-requests/doc/RequestsLibrary.html): ```pip install robotframework-requests```
6. Install [**JSON Library**](https://github.com/robotframework-thailand/robotframework-jsonlibrary): ```pip install -U robotframework-jsonlibrary```
7. Install [**Pabot**](https://pabot.org/) to be able to perform **Parallel execution** when needed: ```pip install -U robotframework-pabot```
8. Install [**VS Code**](https://code.visualstudio.com/download) IDE and install **Robot Framework Language Server** and **Material Icon Theme** plugins on it

## **Execution**:
* To execute all Test Cases/Suites please run the following command from the terminal/commandline: ```robot -d Results Tests``` 
* And we can change variables like this to run on Firefox with headelss mode  ```robot -v browserType:firefox -v headless:True -d Results Tests```
* To execute specefic Test Suite, we need to specify the path to the suite file between single quotes like this: ```robot -d Results 'Tests/User Management/ListUsersTests.robot'```
* To execute specific cases with tag name (Ex: Smoke test cases): ```robot -d Results -i Smoke Tests```
* We can perform **Parallel Execution** with the ```pabot``` instead of ```robo``` command like this: ```pabot -d Results Tests```