## Cucumber for CSL Services

Cucumber for CSL services is aiming for living document, an document which can be read by business and able to test. Document can be test is very powerful document, especially is very helpful for specification document. Because it is not only written how the application to be work but also prove the application is work as expected. 

## Project
Source code can be download from gitlab project https://channels-kl.intranet.standardchartered.com/stevechew/csl-cuke. Please register login in the gitlab(https://channels-kl.intranet.standardchartered.com/users/sign_in?redirect_to_referer=yes), it is a self service registration. The gitlab login doesn't link with peoplesoft id.

## Installation and Environment
i) Please install the ruby and set the environment variable by following below:

1. Download Ruby 1.9.3-p551 and Development Kit from RubyInstaller.org and extract 
* **P/S Or can get the package from \\\10.112.177.87\shared\Users\CheeWah**
* **username/password = picasso/picasso**
2. Install/Extract them into proper directories.
3. Remember to set the Environment Path to use 'ruby' command
* **SET RUBY_HOME=C:\path\to\ruby-1.9.3-p551-i386-mingw32**
* **SET RI_DEVKIT=C:\path\to\devkit**
* **SET PATH=%RUBY_HOME%\bin;%RI_DEVKIT%\bin;%RI_DEVKIT%\mingw\bin;%PATH%**

ii) Install gem bundler (Ruby Environmnent Path Required)

'gem' is a ruby command and all the artificates in ruby are called 'gem'. We will need a gem called **bundler** to execute command 'bundle install'. By command 'bundle install', it will download all the dependancy gem from internet which is require by the ruby project. Example our cucumber with ruby is one of the ruby project.
1. By using command prompt
2. Set Environment Path **set http_proxy=http://10.112.112.73:8080** if you're on SCB network.
3. gem install bundler

iii) Git clone the project from https://channels-kl.intranet.standardchartered.com/stevechew/csl-cuke

iv) bundle install to install the gems dependency from the Gemfile

Every ruby project root directory would have a file called 'Gemfile'. The 'Gemfile' will store all the require gems for an ruby project. Example to download the dependancy gem from the csl-cukes project, please follow the step below:

1. By using command prompt navigate to C:\path\to\csl-cukes
2. bundle install (this may not work when behind proxy)

## Quick Start

To start Cucumber
```
[csl-cukes] $ cucumber
```
To start with specific environment
```
[csl-cukes] $ cucumber penv=staging paxway_is_ready=true
or
[csl-cukes] $ cucumber --profile staging
```
To start with specific tags only
```
[csl-cukes] $ cucumber --tags @http_header
```
Exclude tags to be test
```
[csl-cukes] $ cucumber --tags ~@http_header
```

# Cucumber report
Run 'cucumber --help' for more info.

Example HTML report
```
[csl-cukes] $ cucumber -f html -o report/cucumber_report.html
```

Example JSON report
```
[csl-cukes] $ cucumber -f json -o report/cucumber_report.json
```

# Best Practice Tagging
For the scenario is **work in progress** we can use **@wip**. 

About the related **technical scenario** like testing **http header, http response.code, json schema** and so on we could use **@technical**. 

**Business function** related like own account transfer we can use **@own_account_transfer**.

# Best Practice Writing Feature
Feature can be writing in several line and if we are not sure what to write in feature we could always use the reference below:
```
Feature:
  In order to <Archive something/goal>
  As a <user>
  I need <feature>
```
# Best Practice Writing Scenario
Try to write the words be more business meaning and easy to understand by non-technical people. Scenario usually follow the same pattern like below:

1. Keyword: **Given** - Get the system into particular state.(Pre-define condition)
2. Keyword: **When** - Poke it, tickle it whatever its call.(Execution/action/Process)
3. Keyword: **Then** - Examine the new state.(Verify result)

Example 1:
```
Scenario: Transfer fund from saving account to SCB payee
  Given I have an account "a1234" with amount "20"
   When I transfer fund from to same account
   Then I will get error message "Not allow to transfer within same account"
```

Best practice for the keywords Given, When, Then used only once in a scenario. We can add keyword '**And**' in the midle of the keyword **Given, When, Then**.

Example 2:
```
Scenario: Transfer fund from saving account to SCB payee
  Given I have an saving account "a1234" with amount "20"
    And I have a scb payee "Rachard"
   When I transfer amount "15" to scb payee "Rachard"
   Then I will get success message "..."
    And I will get notification message in my inbox 
    And My saving account "a1234" balance will be left "5"
```

changeit
change it
change it
changeit
change it
changeit
change it