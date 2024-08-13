# Building a Social Networking System Using ASP.NET Core MVC

## Customer
- **Contact**: Ho Duc Linh

## Desciption
Social Network is a stateful web application built with ASP.NET Core API, SQL Server, and Angular. This project provides a comprehensive platform for users to interact, post updates, manage profiles, and communicate.

## Purpose
This document provides comprehensive documentation for a social networking system developed using ASP.NET Core. It includes functional and non-functional requirements, system design, implementation details, deployment instructions, and a user guide.

## Scope
The documentation covers the design, development, and deployment of a social networking web application with core features such as user management, content sharing, social interactions, and notifications.

## Functional Requirements

### User Management
- **Registration**: Users can sign up with email and password.
- **Login/Logout**: Users can log in and log out securely.
- **Profile Management**: Users can manage their profiles, including updating personal information.
- **Password Recovery**: Users can recover their passwords via email.
- **Two-Factor Authentication (2FA)**: Extra layer of security for user accounts.

### Social Interactions
- **Friend Requests**: Users can send and receive friend requests.
- **Following Users**: Users can follow other users.
- **Blocking Users**: Users can block other users.
- **Liking and Commenting on Posts**: Users can like and comment on posts.

### Content Management
- **Creating Posts**: Users can create and share posts.
- **Editing/Deleting Posts**: Users can edit or delete their posts.
- **Sharing Posts**: Users can share posts with their network.

### Notifications
- **Real-Time Notifications**: Notifications using SignalR for real-time updates.
- **Email Notifications**: Users receive notifications via email for important events.

### Privacy Settings
- **Managing Account Privacy**: Users can manage privacy settings for their account.
- **Managing Post Privacy**: Users can set privacy levels for their posts.

## Non-Functional Requirements

### Performance
- **Response Time**: The system should provide quick responses to user actions.
- **Throughput**: The system should handle a high number of simultaneous requests.

### Scalability
- Ability to handle an increasing number of users and growing data volumes.

### Security
- **Data Protection**: Implement data protection and encryption measures.
- **Secure Authentication**: Ensure secure authentication mechanisms.

### Usability
- Provide a user-friendly interface and seamless user experience.

### Reliability
- Ensure high system uptime and fault tolerance.

### Maintainability
- Facilitate ease of updates and ongoing maintenance.

## Technology Stack

- **ASP.NET Core**: A cross-platform, high-performance framework for building modern, cloud-based applications.
- **EF Core**: Entity Framework Core, an ORM framework for .NET.
- **Web API**: To build API services that the front-end can call for data.
- **2FA**: Two-Factor Authentication for enhanced security.
- **SignalR**: Adds real-time web functionality to the application.
- **FrontEnd**: HTML, CSS, JavaScript, Bootstrap 5, and Angular.
- **Amazon S3**: For storing images and videos.

## Version Control

- **GitLab**: Version control is managed using GitLab, integrated with Gmail and ISMS extensions.

## Project Management System

- [Taiga](https://taiga.fa.edu.vn/): Project management and tracking.

## References

- [ASP.NET Core Documentation](https://learn.microsoft.com/en-us/aspnet/core/?view=aspnetcore-8.0)
- [Entity Framework Core Documentation](https://learn.microsoft.com/en-us/ef/core/)
- [SignalR Documentation](https://learn.microsoft.com/en-us/aspnet/core/signalr/introduction?view=aspnetcore-8.0)

## Contact
- Email: thien.thangg03@gmail.com
- Gitlab: thang109
