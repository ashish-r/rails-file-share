# File Sharing Application - Product Document

## Objective
Build an online file sharing application using Rails.

## Features
**Note:** The UI mock-ups provided here are for ***representational purpose only***. You don’t need to abide by this design, but make sure all of the stated requirements are sufficiently met.

This application should have the following features:

### User Management

#### Sign up

- As a new user, I should be able to register for a new account. The application should ask for the following details about a new user:
  1. Unique username: The application should provide a warning incase the username is already taken.
  2. Email address
  3. Password: The password should contain -
     1. Greater than 8 characters
     2. Include at least one uppercase letter
     3. Include at least one lower
     4. Include at least one letter

  ![Screenshot](../rapid-share-assets/pasted&#32;image&#32;0.png)

#### Login

- Once an account is created, a user should be able to login to their account.
  1. If the login is successful: They should be taken to their “File Dashboard” which will serve as their homepage and display the various files associated with their account.
  2. If the login is unsuccessful: Then the following message should be displayed - “Couldn’t find that user! Please try again”

  ![Screenshot](../rapid-share-assets/pasted&#32;image&#32;0(1).png)

#### Logout

A logged in user should be able to log out by clicking a button. Once a user is logged out, they should be redirected to the login page.


#### User Profile

- There should be a profile page for every user. They should be able to update various details about their account like:
  1. Name
  2. Email address

  ![Screenshot](../rapid-share-assets/pasted&#32;image&#32;0(2).png)


### File Management

Here are the various features needed for file management:

  - **File Dashboard**: This will contain the various files associated with a user account. The files should be displayed as tiles within a grid. The files should be organized in descending order of upload date, i.e. latest file first. For every file the following details should be displayed:
    1. Name (include extension), e.g. “big_win.pdf”
    2. Upload date: This is the date on which the file has been uploaded. The date should be presented in the format of “<Day> <Month> <Year>” (e.g. 23 May 2018).
  - **File Upload**: A user should be able to click a button which will display a file uploader in the browser and select a file they would like to upload. A user should be able to upload one file at a time.
  - **File Download**: A user should be able to click on the download action next to every file to download the associated file.
  - **File Share**: A user should be able to turn on public sharing of a file using a “ON/OFF” toggle control. Once public sharing is turned on, then a unique URL should be made available next to the toggle button which is publically accessible. The user shouldn’t be able to delete or share this file.
  - **File Deletion**: A user should be able to click on the delete action next to every file to delete the associated file.

  ![Screenshot](../rapid-share-assets/pasted&#32;image&#32;0(3).png)


### File Sharing

There should be a stand-alone page for a shared file.

  ![Screenshot](../rapid-share-assets/pasted&#32;image&#32;0(4).png)


## Technical requirements

- You are allowed to use allowed to use gems/libraries for file upload and session management (e.g. paperclip, devise etc).
- Write unit test cases for all model and controller methods using rspec.
- Please make sure that you're using Rails 4.1.15 at max, and rspec 3.X versions.
