<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanPaye!=null&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanPaye.formFicheSalarie!=null}" var="ficpay">

    <c:choose>

        <c:when test="${bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanPaye.formFicheSalarie.var_action>=1}" >
            <jsp:include flush="true" page="/paye/FicheSalarieFiche.jsp" />
        </c:when>

        <c:otherwise>
            <jsp:include flush="true" page="/paye/FicheSalarieList.jsp" />
        </c:otherwise>

    </c:choose>

</c:if>
