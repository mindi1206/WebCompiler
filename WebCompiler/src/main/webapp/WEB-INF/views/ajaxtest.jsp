<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css" type="text/css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/custom_main.css" />
   <link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/custom_problem_insert.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" /> <!-- 이게 Font Awesome 5 Free를 사용하게 해주는거 같아요. 이거덕에 사이드바 모양이 보여요! -->

    <script>
    	
    </script>
</head>
<body class="is-preload">
    <!-- Wrapper -->
    <div id="wrapper">

        <!-- Main -->
        <div id="main">
            <!-- Header -->
			<jsp:include page="header.jsp" flush="true">
				<jsp:param name="imgURL" value="" />
			</jsp:include>
			
            
            <div class="inner">

                <section>
                    
                    <div class="title_box" id="title_box">
			
			1. 기초<br>
			과일이름 
			<input type="text" name="fruit_name" id="fruit_name"/>
			<input type="button" onclick="id_check()" class="id_check" value="가격확인"> <br>
			과일가격 <input type="text" name="fruit_price" id="fruit_price"/> <br>
			
			<br>
			
			2. VO 하나 리턴<br>
			과일이름 
			<input type="text" name="fruit_name" id="fruit_name"/> <input type="button" onclick="selectOne()" class="id_check" value="과일 정보 갖고오기"> <br>
			<br>
			
			과일이름 
			<input type="text" name="fruit_name" id="fruit_name"/> <br>
			과일가격 <input type="text" name="fruit_price" id="fruit_price"/> <br>
			소개<br>
			<textarea name="fruit_introduce" cols="50" rows="2" id="fruit_introduce"></textarea> <br>
			
			
			3. List<br>
			
			<input type="button" onclick="selectAll()" class="id_check" value="과일 리스트 갖고오기"> <br>
			4. Map 사용 여러항목 리턴<br>
			5. VO 전송 (JSON)<br>
			과일이름 
			<input type="text" name="fruit_name" id="fruit_name"/> <br>
			
			과일가격 <input type="text" name="fruit_price" id="fruit_price"/> <br>
			소개<br>
			<textarea name="fruit_introduce" cols="50" rows="2" id="fruit_introduce"></textarea> <br>
			<input type="button" onclick="insert()" class="id_check" value="과일 등록하기" style="float:right"> <br>
			
			
			<br><br>
	
			
						</div>
                    
                </section>
            </div>
        </div>

    </div>

    <!-- Scripts -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/browser.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/breakpoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<script>
		function insert(){
			var fruit = {
					fruit_name: $("#fruit_name").val();
					fruit_price: $("#fruit_price").val();
					fruit_introduce: $("#fruit_introduce").val();
			}

			$.ajax({
				url: "/insert",
				type: "POST",
				data : JSON.stringify(fruit),
				contentType: "application/json; charset=utf-8;",

				success : function(result) {
					
				},
				error : function() {
					
				}
			}
			);
			
		}


	</script>
</body>
</html>