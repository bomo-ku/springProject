<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<script>
var result = '${savedName}';
parent.addFilePath(result);
</script>