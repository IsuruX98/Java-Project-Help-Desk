<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!-- importing the tag library connection -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
    
<!DOCTYPE html>

<html lang="en-gb" dir="ltr">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Register</title>

    <!-- UIkit CSS -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/uikit@3.15.11/dist/css/uikit.min.css"
    />

    <!-- UIkit JS -->
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.15.11/dist/js/uikit.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.15.11/dist/js/uikit-icons.min.js"></script>
  </head>

  <body>
  
  <!-- to catch the servlet status msg -->
	<input type="hidden" id="status" value="<%= request.getAttribute("status")%>">
  
    <!-- header -->

    <header>
      <div
            class="uk-background-secondary"
            uk-sticky="sel-target: .uk-navbar-container; cls-active: uk-navbar-sticky"
    >
        <nav class="uk-navbar-container uk-navbar-transparent">
            <div class="uk-container">
                <div data-uk-navbar>
                    <div class="uk-navbar-left">
                        <a
                                class="uk-navbar-item uk-logo uk-visible@m uk-text-muted uk-text-bold uk-text-bolder"
                                href="index.jsp"
                        >Help Desk</a
                        >
                    </div>
                    <div class="uk-navbar-center uk-hidden@m">
                        <a
                                class="uk-navbar-item uk-logo uk-text-muted uk-text-bold"
                                href="index.jsp"
                        >Help Desk</a
                        >
                    </div>
                    <div class="uk-navbar-right">
                        <ul class="uk-navbar-nav uk-visible@m">
                            <li><a href="index.jsp">Home</a></li>
                            <li><a href="#">View Articles</a></li>
                            <li><a href="#faq">FAQ</a></li>
                            <li><a href="contactUs.jsp">Contact Us</a></li>
                            <li>

                                <div class="uk-navbar-item">
                                
									<!-- check for the user type -->
                                    
                                    <%
                                    if(session.getAttribute("name")==null){
                                    out.print("<a class=\"uk-button uk-button-small uk-text-bold\"href=\"login.jsp\">Login</a>");                                    
                                    }else{
                                    out.print("<a class=\"uk-button uk-button-small uk-text-bold\" href=\"acc.jsp\">");
                                    %>
                                    <%= session.getAttribute("name")%>
                                    <%
                                    out.print("</a>");
                                    }
                                    %>

                                </div>
                            </li>
                        </ul>
                        <a
                                class="uk-navbar-toggle uk-hidden@m"
                                href="#offcanvas"
                                data-uk-toggle
                        ><span data-uk-navbar-toggle-icon></span>
                            <span class="uk-margin-small-left">Menu</span></a
                        >
                    </div>
                </div>
            </div>
        </nav>
    </div>
    </header>

    <!-- header ends -->

    <div class="uk-child-width-1-2@m uk-grid-small uk-grid-match" uk-grid>
      <div>
        <div class="uk-card">
          <div class="uk-container uk-container-large uk-padding-large">
            <article
              class="uk-article uk-margin-large"
              data-uk-scrollspy="cls: uk-animation-slide-bottom-medium; repeat: true"
            >
              <h1 class="uk-text-center uk-text-bolder">Register</h1>
              <div class="uk-article-content">
                <form
                  class="uk-form-stacked uk-margin-medium-top uk-margin-medium-bottom" action="reg" method="post"
                >
                  <div class="uk-margin-bottom">
                    <label class="uk-form-label uk-text-left" for="name"
                      >Name</label
                    >
                    <div class="uk-form-controls">
                      <input
                        id="uname"
                        class="uk-input uk-border-rounded"
                        name="uname"
                        type="text"
                        
                      />
                    </div>
                  </div>
                  <div class="uk-margin-bottom">
                    <label class="uk-form-label uk-text-left" for="name"
                      >E-mail</label
                    >
                    <div class="uk-form-controls">
                      <input
                        id="uemail"
                        class="uk-input uk-border-rounded"
                        name="uemail"
                        type="email"
                        
                      />
                    </div>
                  </div>
                  <div class="uk-margin-bottom">
                    <label class="uk-form-label uk-text-left" for="name"
                      >Mobile Number</label
                    >
                    <div class="uk-form-controls">
                      <input
                        id="umobile"
                        class="uk-input uk-border-rounded"
                        name="umobile"
                        type="text"
                        
                      />
                    </div>
                  </div>
                  <div class="uk-margin-bottom">
                    <label class="uk-form-label uk-text-left" for="_replyto"
                      >Password</label
                    >
                    <div class="uk-form-controls">
                      <input
                        id="upw"
                        class="uk-input uk-border-rounded"
                        name="upw"
                        type="password"
                        
                      />
                    </div>
                  </div>
                  <div class="uk-margin-bottom">
                    <label class="uk-form-label uk-text-left" for="_replyto"
                      >Reapeat Password</label
                    >
                    <div class="uk-form-controls">
                      <input
                        id="pwd"
                        class="uk-input uk-border-rounded"
                        name="rpwd"
                        type="password"
                        
                      />
                    </div>
                  </div>
                  <br />
                  <div class="uk-margin-bottom">
                    <a class="uk-link-muted" href="login.jsp"
                      >already a member please login here</a
                    >
                  </div>
                  <div class="uk-text-center">
                    <input
                      class="uk-button uk-button-primary uk-border-rounded uk-width-1-1"
                      type="submit"
                      value="Register"
                    />
                  </div>
                </form>
              </div>
            </article>
          </div>
        </div>
      </div>
      <div>
        <div class="uk-card uk-background-default uk-hidden\@l">
          <div class="uk-position-center uk-position-relative">
            <img width="650px" src="img/register.jpg" alt="" />
          </div>
        </div>
      </div>
    </div>

    <!-- responsive menu -->

<div id="offcanvas" data-uk-offcanvas="flip: true; overlay: true">
    <div class="uk-offcanvas-bar">
        <a class="uk-logo" href="index.html">Help Desk</a>
        <button class="uk-offcanvas-close" type="button" data-uk-close></button>
        <ul
                class="uk-nav uk-nav-primary uk-nav-offcanvas uk-margin-top uk-text-center uk-text-small"
        >
            <li><a href="index.jsp">Home</a></li>
                            <li><a href="#">View Articles</a></li>
                            <li><a href="#faq">FAQ</a></li>
                            <li><a href="contactUs.jsp">Contact Us</a></li>
                            <li>

                                <div class="uk-navbar-item">
                                
									<!-- check for the user type -->
                                    
                                    <%
                                    if(session.getAttribute("name")==null){
                                    out.print("<a class=\"uk-button uk-button-small uk-text-bold\"href=\"login.jsp\">Login</a>");                                    
                                    }else{
                                    out.print("<a class=\"uk-button uk-button-small uk-text-bold\" href=\"acc.jsp\">");
                                    %>
                                    <%= session.getAttribute("name")%>
                                    <%
                                    out.print("</a>");
                                    }
                                    %>

                                </div>
                            </li>
        </ul>
        <div class="uk-margin-top uk-text-center">
            <div
                    data-uk-grid
                    class="uk-child-width-auto uk-grid-small uk-flex-center"
            >
                <div>
                    <a
                            href="https://twitter.com/"
                            data-uk-icon="icon: twitter"
                            class="uk-icon-link"
                            target="_blank"
                    ></a>
                </div>
                <div>
                    <a
                            href="https://www.facebook.com/"
                            data-uk-icon="icon: facebook"
                            class="uk-icon-link"
                            target="_blank"
                    ></a>
                </div>
                <div>
                    <a
                            href="https://www.instagram.com/"
                            data-uk-icon="icon: instagram"
                            class="uk-icon-link"
                            target="_blank"
                    ></a>
                </div>
                <div></div>
            </div>
        </div>
    </div>
</div>

<!-- responsive menu ends -->

<!-- footer -->

<footer
        class="uk-section uk-background-secondary uk-text-center uk-text-muted"
>
    <div class="uk-container uk-container-small">
        <div>
            <ul class="uk-subnav uk-flex-center">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="#faq">FAQ</a></li>
                <li><a href="#">View Articles</a></li>
            </ul>
        </div>
        <div class="uk-margin-medium">
            <div
                    data-uk-grid
                    class="uk-child-width-auto uk-grid-small uk-flex-center"
            >
                <div class="uk-first-column">
                    <a
                            href="https://twitter.com/"
                            data-uk-icon="icon: twitter"
                            class="uk-icon-link uk-icon"
                            target="_blank"
                    ></a>
                </div>
                <div>
                    <a
                            href="https://www.facebook.com/"
                            data-uk-icon="icon: facebook"
                            class="uk-icon-link uk-icon"
                            target="_blank"
                    ></a>
                </div>
                <div>
                    <a
                            href="https://www.instagram.com/"
                            data-uk-icon="icon: instagram"
                            class="uk-icon-link uk-icon"
                            target="_blank"
                    ></a>
                </div>
            </div>
        </div>
        <div class="uk-margin-medium uk-text-small uk-link-muted">
            &copy; Copyright Help desk. All Rights Reserved
        </div>
    </div>
</footer>
    
    <!-- JS alert for registration is done -->
	
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>
	<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'></link>  
	
	<script type="text/javascript">
	
	var status = document.getElementById("status").value;
	if (status == "success") {
		swal("congrats","account created successfully","success");
	}if(status == "deleted") {
		swal("Done","account Deleted successfully","success");
	}if (status == "pwdmissmatch") {
		swal("Sorry","password miss match","error");
	}if (status == "pwlengthshort") {
		swal("Sorry","password length must be 8 or higher","error");
	}if (status == "fieldmissing") {
		swal("Sorry","every field must filled","error");
	}
	
	</script>
  </body>
</html>
