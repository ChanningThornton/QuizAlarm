# Design

##Main.storyboard
This file is where the design for the user interface is located. Here you can see the layout used when the app is running as well as the different segues conecting them. This file also contains the navigation controller that is responsible for the navigation board at the top of the screen used in the app.

##ViewController.swift
In this file is the code that effects most of the visuals in the home page of the app. This file contains functions that allow the screen to be turned off and prevents the phone from going to sleep. This is also where the code is that allows both the current time to be displayed and the next alarm to be displayed. The next alarm function works by getting the next alarm from the AlarmManager and displaying it on screen. If the next alarm does not exist than the text "No alarm set" will be displayed instead. The current time display works by getting the current time and updating it to the screen every second.

##AddAlarmViewController.swift
Checks the user's input when the save button is pressed then saves it to the AlarmManager.  

##AlarmListTableViewController.swift
This file is used to control the table displayed on the alarms page of the app. This file is responsible for getting data from the AlarmManager and displaying it in the proper format.

##MathQuizViewController.swift
This file is used to control what is displayed when a math question is given to the user. It will first begin to play the alarm sound and continue playing until it sees that all the problems have been completed. It will then display a randomized math problem and check for user input. If answered corectly, the program will then check to see if it needs to be repeated or will send you back to the home page.

##Alarm.swift
Creates an alarm object that is used in the AlarmManager.

##AlarmManager.swift
This file is used to keep track of alarms so that they can be saved and removed. It contains code to get the next alarm that is used in the home page. It also saves alarms using code from FileDataAdapter.

##FileDataAdapter.swift
Open source code that converts and saves data as a json file. This was used to save alarms so that when the app is relaunched the data could be read back in.

##Utility.swift
This file is an extension of the Date class and is used to compare times .
