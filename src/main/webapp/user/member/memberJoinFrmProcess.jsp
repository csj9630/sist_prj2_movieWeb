<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
/* POST방식에서 한글 깨짐 방지. */
request.setCharacterEncoding("UTF-8");
%>

<div class="col-md-7">
	<jsp:useBean id="pDTO" class="day1128.ParamDTO" scope="page" />
	<!-- web parameter를 한번에 받을 수 있다. -->
	<jsp:setProperty property="*" name="pDTO" />
	<%
	//web parameter가 아닌 접속자의 정보 받아야할 때
	String ip = request.getRemoteAddr();
	pDTO.setIp(ip);
	//secChUaPlatform, userAgents
	pDTO.setSecChUaPlatform(request.getHeader("sec-ch-ua-platform"));
	pDTO.setSecChUaPlatform(request.getHeader("user-agent"));
	%>


	<%
	//name은 유일한 이름이기 때문에 괜찮지만
	//emain은 mail과 domain으로 분리되어 있다.
	pDTO.setEmail(request.getParameter("mail") + "@" + request.getParameter("domain"));

	WebMemberService wms = WebMemberService.getInstance();

	//한정적인 자원을(id) 동시에 사용할 때 조회를 먼저 수행한 후 다음 작업으로 진행한다.
	boolean idFlag = wms.searchId(pDTO.getId());
	if (!idFlag) {//아이디를 선점한 경우.
	%>
	입력하신 ${ param.id }는 이미 사용중입니다.<br> 다른 아이디를 입력해주세요. <a
		href="javascript:history.back()" class="btn btn-sucess">뒤로</a>
	<%
	} else {

	boolean addFlag = wms.addMember(pDTO, spVO.getKey());
	pageContext.setAttribute("addFlag", addFlag);
	%>
	<c:choose>
		<c:when test="${addFlag }">



			<strong>${ param.id }<%-- <jsp:getProperty property="id" name="pDTO"/> --%></strong>
			<!-- EL쓰면 짧아진다. -->
				님
				회원 가입을 축하드립니다.<br>
				기존 서비스와는 차별화된 새로운 사용자 경험을 제공합니다.<br>
			<img src="../common/images/img_4.jpg">
			<br>
				아이디 : <input type="text" value="${param.id}" />
			<br>
				비밀번호 : ${param.pass }<br>
				이름 : ${param.name }<br>
				이메일 : ${param.mail }@${ param.domain }<br>
				생년월일 : ${param.birth }<br>
				거주지 : ${param.loc}<br>
				소개 : ${param.intro}<br>
				코드 : ${param.code }<br>

			<div>
				<strong>&lt;jsp:getProperty 사용</strong><br> 주소 :
				<jsp:getProperty property="language" name="pDTO" /><br>
				<%
				//<jsp:getProperty를 사용하면 배열의 요소를 출력할 수 없다.
				String[] lang = request.getParameterValues("language");
				if (lang != null) {//NullPointerException 발생을 막기 위해서.
					for (int i = 0; i < lang.length; i++) {
				%>
				<%=lang[i]%>
				<%
				} //end for
				} //end if
				%>
			</div>
			<div>
				<strong>&lt;c:forEach 사용</strong><br>
				<c:forEach var="lang" items="${ paramValues.language }"
					varStatus="i">
					<c:out value="${ i.count }" />.<c:out value="${ lang }" />
				</c:forEach>
			</div>

		</c:when>
		<c:otherwise>
			<img src="../common/images/fail.png" />
			<br>
				${ param.name }님 회원 가입을 실패하였습니다. <br>
				잠시 후 다시 시도해 주세요.<br>
			<a href="javascript:histroy.back()">뒤로</a>
		</c:otherwise>
	</c:choose>
	<%
	} //end else
	%>
</div>