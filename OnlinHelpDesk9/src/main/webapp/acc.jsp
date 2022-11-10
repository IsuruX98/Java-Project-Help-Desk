<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!-- importing the tag library connection -->
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
if(session.getAttribute("name")==null){
	response.sendRedirect("login.jsp");
}
%>    
    
<!DOCTYPE html>
<html lang="en-gb" dir="ltr">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>User Profile</title>

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
              <h1 class="uk-text-center uk-text-bolder">User Profile</h1>
              <div class="uk-article-content">
                <div class="uk-margin-medium-top uk-margin-medium-bottom">
                
                <input type="hidden" id="status" value="<%= request.getAttribute("status")%>">
                <input type="hidden" id="deleteticket" value="<%= request.getAttribute("deleteticket")%>">
	
	
	<!-- looping the user data using c tag library -->
				<table class="uk-table uk-table-divider uk-table-hover">
                    <tr>
                      <td class="uk-text-bold">User ID :</td>
                      <td><%= session.getAttribute("id")%></td>
                    </tr>
                    <tr>
                      <td class="uk-text-bold">Name :</td>
                      <td><%= session.getAttribute("name")%></td>
                    </tr>
                    <tr>
                      <td class="uk-text-bold">E-mail :</td>
                      <td><%= session.getAttribute("email")%></td>
                    </tr>
                    <tr>
                      <td class="uk-text-bold">Mobile No :</td>
                      <td><%= session.getAttribute("mobile")%></td>
                    </tr>
                  </table>

                  <br />
                 

                  <div class="uk-margin-bottom">
                    <div class="uk-text-center">
                    <form action="y_view" method="post">
                    <input type="hidden" name="id" value="<%= session.getAttribute("id")%>">
                      <input
                        class="uk-button uk-button-primary uk-border-rounded uk-width-1-1"
                        type="submit"
                        value="my tickets"
                      />
                      </form>
                    </div>
                  </div>
                  
              <!-- storing the data into a link that need to pass to another page and storing them in to a single variable -->

				   <div class="uk-margin-bottom">
                      <div class="uk-text-center">
                      
                      <!-- passing the variable that stored data and the link in the above to the below anchor, so that when we click that button it will redirect us to another page with the data  -->
						
						<a href="updateuser.jsp">
						
                         <input class="uk-button uk-button-primary uk-border-rounded uk-width-1-1"
                          type="button" name="update" value="update my data"/>
                        
						</a>
						
                      </div>
                    </div>
	
				 <!-- logout  -->

                  <div class="uk-margin-bottom">
                      <div class="uk-text-center">
                   
					<a class="uk-button uk-button-danger uk-border-rounded uk-width-1-1 uk-button-small" href="logout">Logout</a> 
                  </div>
                    </div>
            
                  <!-- to delete data  -->
                  
				<div class="uk-margin-bottom">
                      <div class="uk-text-center">
				<a href="deleteaccconfirm.jsp">
				<input class="uk-button uk-button-danger uk-border-rounded uk-width-1-1 uk-button-small" type="button" value="delete my data"">
				</a>
				</div>
                </div>
                  
                </div>
              </div>
            </article>
          </div>
        </div>
      </div>
     

      <div>
        <div class="uk-card uk-background-default">
          <div class="uk-position-center uk-position-relative">
            <img
              width="500px"
              src="img/userProfile.jpg"
              alt=""
            />
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

<!-- JS alert for delete is fail -->
	
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>
	<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'></link>  
	<script type="text/javascript">
	
	var deleteticket = document.getElementById("deleteticket").value;
	
	if (deleteticket == "deleted") {
		swal("Success","your ticket has been deleted successfully.","success");
	}
	
	function myFunction() {
		if (confirm("Do you want to delete?") == true) {
			document.getElementById("myForm").submit();
	    
	} else {
	    confirm()
	}
		  
		  
		}
	
	
	</script>	
</body>
</html>