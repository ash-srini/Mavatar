Mavatar
=======

Get unique avatars that you can share on Facebook.

- The landing page of the application is a simple jsp page that takes your unique email address as an input 
  and lets you chood from three different types of avatars.
- The email address is passed to a util class that creates and returns a MD5 hash value in hexadecimal format 
  to the controller.
- The controller crestes a url string with this hashed value and the type of avatar selected as a query string 
  to Gravatar which in turn renders an image that is associated with the MD5 hash value.

What is used in the application?
- Spring framework is used to create the application.
- JQuery AJAX is used to verifiy if the entered email address is valid and to load the image for the valid entry.
- This application is hosted on Google App engine, the URL is as follows:
  http://mavatargenerator.appspot.com
- You can also share the rendered image on Facebook with your friends!


