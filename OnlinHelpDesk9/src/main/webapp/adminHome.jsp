<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en-gb" dir="ltr">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Help Desk</title>

    <link
      href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700&display=swap"
      rel="stylesheet"
    />

    <!-- UIkit CSS -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/uikit@3.15.11/dist/css/uikit.min.css"
    />

    <!-- <script src="js/uikit.js"></script> -->

    <!-- UIkit JS -->
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.15.11/dist/js/uikit.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.15.11/dist/js/uikit-icons.min.js"></script>
  </head>

  <body>
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
                  href="adminHome.jsp"
                  >Help Desk Admin</a
                >
              </div>
              <div class="uk-navbar-center uk-hidden@m">
                <a
                  class="uk-navbar-item uk-logo uk-text-muted uk-text-bold"
                  href="adminHome.jsp"
                  >Help Desk Admin</a
                >
              </div>
              <div class="uk-navbar-right">
                <ul class="uk-navbar-nav uk-visible@m">
                  <li><a href="adminHome.jsp">Home</a></li>
                  
                  <li>
                    <div class="uk-navbar-item">
                      <%
					if(session.getAttribute("name")==null){
						out.print("<a class=\"uk-button uk-button-small uk-text-bold\" href=\"login.jsp\">Login</a>");
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

      <div
        class="uk-section-large uk-position-relative uk-position-z-index uk-background-fixed uk-light"
        style="background-image: url(img/home.jpg)"
      >
        <div
          class="uk-container"
          data-uk-scrollspy="cls: uk-animation-slide-bottom-medium; repeat: true"
        >
          <h1 class="uk-text-center uk-margin-remove-top uk-text-bolder">
            Welcome to Admin Home
          </h1>
          <h3 class="uk-text-center uk-margin-remove-top"><%= session.getAttribute("name")%></h3>
        </div>
      </div>
    </header>

    <!-- header ends -->
    
    <!-- status from java class -->
	<input type="hidden" id="FAQ" value="<%= request.getAttribute("FAQ")%>">
	<input type="hidden" id="FAQdelete" value="<%= request.getAttribute("FAQdelete")%>">
	<input type="hidden" id="FAQupdate" value="<%= request.getAttribute("FAQupdate")%>">

    <div class="uk-section">
    
        
      <div
        class="uk-container"
        data-uk-scrollspy="cls: uk-animation-scale-up; repeat: true"
      >
        <div class="uk-text-center" uk-grid>
          <div class="uk-width-expand@m">
            <div
              class="uk-card uk-card-default uk-card-body uk-card-hover uk-border-rounded"
            >
              <a class="uk-position-cover" href="userlist"></a>
              <h3 class="uk-card-title uk-margin-remove uk-text-secondary">
                                View User List
                            </h3>
            </div>
          </div>
          <div class="uk-width-expand@m">
            <div
              class="uk-card uk-card-default uk-card-body uk-card-hover uk-border-rounded"
            >
              <a class="uk-position-cover" href="msglist"></a>
              <h3 class="uk-card-title uk-margin-remove uk-text-secondary">
                                View Message List
                            </h3>
              
            </div>
          </div>
        </div>

        <div class="uk-text-center" uk-grid>
        
          <div class="uk-width-expand@m">
            <div
              class="uk-card uk-card-default uk-card-body uk-card-hover uk-border-rounded"
            >
              <a class="uk-position-cover" href="yadminlist"></a>
              <h3 class="uk-card-title uk-margin-remove uk-text-secondary">
                                View Ticket List
                            </h3>
            </div>
          </div>
          <div class="uk-width-expand@m">
            <div
              class="uk-card uk-card-default uk-card-body uk-card-hover uk-border-rounded"
            >
              <a class="uk-position-cover" href="AddFAQ.jsp"></a>
              <h3 class="uk-card-title uk-margin-remove uk-text-secondary">
                                Add FAQ
                            </h3>
            </div>
          </div>
        </div>

        <div class="uk-text-center" uk-grid>
        
          <div class="uk-width-expand@m">
            <div
              class="uk-card uk-card-default uk-card-body uk-card-hover uk-border-rounded"
            >
              <a class="uk-position-cover" href="faqSearch.jsp"></a>
              <h3 class="uk-card-title uk-margin-remove uk-text-secondary">
                                Search FAQ
                            </h3>
            </div>
          </div>
          <div class="uk-width-expand@m">
            <div
              class="uk-card uk-card-default uk-card-body uk-card-hover uk-border-rounded"
            >
              <a class="uk-position-cover" href="article.jsp"></a>
              <h3 class="uk-card-title uk-margin-remove uk-text-secondary">
                                Add New Article
                            </h3>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- responsive menu -->

    <div id="offcanvas" data-uk-offcanvas="flip: true; overlay: true">
      <div class="uk-offcanvas-bar">
        <a class="uk-logo" href="adminHome.html">Help Desk Admin</a>
        <button class="uk-offcanvas-close" type="button" data-uk-close></button>
        <ul
          class="uk-nav uk-nav-primary uk-nav-offcanvas uk-margin-top uk-text-center uk-text-small"
        >
          <li><a href="adminHome.jsp">Home</a></li>
                  
                  <li>
                    <div class="uk-navbar-item">
                      <%
					if(session.getAttribute("name")==null){
						out.print("<a class=\"uk-button uk-button-small uk-text-bold\" href=\"login.jsp\">Login</a>");
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

    <!-- footer ends -->
    <!-- JS alerts -->

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'></link>

<script type="text/javascript">

    var FAQ = document.getElementById("FAQ").value;
    if (FAQ == "FAQadded") {
        swal("Success", "FAQ added successfully", "success");
    }
    var FAQdelete = document.getElementById("FAQdelete").value;
    if (FAQdelete == "FAQdeleted") {
        swal("Success", "FAQ deleted successfully", "success");
    }
    var FAQupdate = document.getElementById("FAQupdate").value;
    if (FAQupdate == "FAQupdated") {
        swal("Success", "FAQ updated successfully", "success");
    }

</script>
  </body>
</html>
